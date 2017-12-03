8.times do |n|
  name = Faker::Book.unique.genre
  Category.create!(name: name, parent_id: "0")
end

User.create!(name:  "Tran Hoang", email: "hoang@gmail.com", password: "123123",
  password_confirmation: "123123")

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name, email: email, password: password,
    password_confirmation: password)
end

10.times do |n|
  name = Faker::Name.name
  Publisher.create!(name: name)
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.user_follow(followed)}
followers.each {|follower| follower.user_follow(user)}
