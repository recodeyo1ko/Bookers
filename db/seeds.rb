# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "11",
  email: "1@1",
  password: "111111"
)

Book.create!([
  {
    title: "11",
    body: "11",
    user_id: "1",
    created_at: "2023-05-17 23:59:59.999999"
  },
  {
    title: "11",
    body: "11",
    user_id: "1",
    created_at: "2023-05-16 23:59:59.999999"
  },
  {
    title: "0512",
    body: "0512",
    user_id: "1",
    created_at: "2023-05-15 23:59:59.999999"
  },
  {
    title: "0513",
    body: "0513",
    user_id: "1",
    created_at: "2023-05-14 23:59:59.999999"
  },
  {
    title: "0514",
    body: "0514",
    user_id: "1",
    created_at: "2023-05-14 23:59:59.999999"
  }
  
])