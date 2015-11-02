User.destroy_all
Story.destroy_all
Category.destroy_all
Location.destroy_all

u1 = User.create!(email: "j@j.com", password: "password")

# By using u1.stories -> we automatically populate user_id in that story
s1 = u1.stories.create(title: "Amazing story", content: "Here is a story")

# Categories
cat1 = Category.create!(name: "🐻")

# Locations
loc1 = Location.create!(name: "London")
loc2 = Location.create!(name: "Paris")
