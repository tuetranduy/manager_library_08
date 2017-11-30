8.times do |n|
  name = Faker::Book.genre
  Category.create!(name: name, parent_id: "0")
end
