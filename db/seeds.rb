# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
  {
    name: "number1",
    email: "number1@number1",
    password: "111111"
  },
  {
    name: "number2",
    email: "number2@number2",
    password: "222222"
  },
  {
    name: "number3",
    email: "number3@number3",
    password: "333333"
  },
  {
    name: "number4",
    email: "number4@number4",
    password: "444444"
  }
])

Book.create!([
  {
    user_id: 1,
    title: "number1",
    body: "number1"
  },
  {
    user_id: 2,
    title: "number2",
    body: "number2"
  },
  {
    user_id: 3,
    title: "number3",
    body: "number3"
  },
  {
    user_id: 4,
    title: "number4",
    body: "number4"
  }
])