class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show update ]

  def index
    @account = Account.find(Current.user.accounts.first.id)
    @transactions = Transaction.where(account_id: @account.id)
    if @transactions.count == 0
      respond_to do |format|
        format.html { redirect_to @account, notice: "No Transactions found." }
        format.json { render :show, location: @account }
      end
    end
  end

  def bank_statement
    @account = Account.find(params[:account_id])
    @transactions = Transaction.where(account_id: @account.id)
    @starting_balance = @account.balance
    @transactions.each do |transaction|
      if transaction.source == "Debit"
        @starting_balance = @starting_balance - transaction.amount
      else
        @starting_balance = @starting_balance + transaction.amount
      end
    end
  end

  def show
  end

  def new
    @account = Account.find(params[:id])
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @account = Account.find(@transaction[:account_id])
    respond_to do |format|
      unless balance_enough?(@transaction, @account)
        @transaction.errors.add(:amount, message: "Balance is not enough for transaction")
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: transaction.errors, status: :unprocessable_entity }
      else
        transfer_amount(@transaction, @account)
        @transaction.save
        format.html { redirect_to @transaction, notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:amount, :source, :sender, :receiver, :account_id)
    end

    def balance_enough?(transaction, account)
      total = account.overdraft.available ? account.balance + (account.overdraft.limit - account.overdraft.used_amount) : account.balance
      total >= transaction.amount
    end

    def transfer_amount(transaction, account)
      amount = transaction.amount

      if account.balance > amount
        account.balance = account.balance - amount
      elsif account.balance > 0
        amount = amount - account.balance
        account.balance = 0
        account.overdraft.used_amount = account.overdraft.used_amount + amount
      else
        account.overdraft.used_amount = account.overdraft.used_amount + amount
      end

      account.overdraft.save && account.save
      return unless same_bank_transaction?(transaction.receiver)
      receiver = Account.find_by(account_number: transaction.receiver)
      receiver.balance = receiver.balance + transaction.amount
      receiver.save

      create_receiver_transaction(transaction, receiver)
    end

    def same_bank_transaction?(account_number)
      Account.where(account_number: account_number).present?
    end

    def create_receiver_transaction(transaction, receiver)
      transaction_2 = transaction.dup
      transaction_2.account_id = receiver.id
      transaction_2.source = "Debit"
      transaction_2.save
    end
end
