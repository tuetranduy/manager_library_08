8.times do |n|
  name = Faker::Book.genre
  Category.create!(name: name, parent_id: "0")

User.create!(name:  "Tran Hoang", email: "hoang@gmail.com", password: "123123",
  password_confirmation: "123123")

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name, email: email, password: password,
    password_confirmation: password)
end
