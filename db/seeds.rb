Language.create!(name: "English")
Language.create!(name: "Japanese")
Language.create!(name: "Korean")


60.times do |n|
  name = Faker::Name.name
  email = "user-#{n+1}@gmail.com"
  password = "123456"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               confirmed_at: Time.zone.now)
end

30.times do |n|
  name = Faker::Name.name
  description = "A free and open source e-learning web application."
  Category.create!(name: name,
               description: description)
end
