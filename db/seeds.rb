# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

city = City.create(name: "London")
country = Country.create(name: "UK")
branch = Branch.create(name: "Headquarters", city: city, country: country)

current_account = AccountType.create(name: "Current")
saving_account = AccountType.create(name: "Saving")
student_account = AccountType.create(name: "Student")