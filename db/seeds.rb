User.destroy_all
Story.destroy_all
Category.destroy_all
Location.destroy_all

u1 = User.create!(email: "j@j.com", password: "password")

# By using u1.stories -> we automatically populate user_id in that story
s1 = u1.stories.create(title: "Amazing story", content: "Here is a story")

# Categories
cat1 = Category.create!(name: "🛁")      # washing
cat2 = Category.create!(name: "💩👊✴")   # shit hit the fan
cat3 = Category.create!(name: "💪")      # working out
cat4 = Category.create!(name: "💘")      # romantic 
cat5 = Category.create!(name: "😀")      # happy 
cat6 = Category.create!(name: "😎")      # cool
cat7 = Category.create!(name: "😉")      # cheeky
cat8 = Category.create!(name: "😊")      # chuffed
cat9 = Category.create!(name: "😇")      # saintly
cat10 = Category.create!(name: "😮")     # shocking
cat11 = Category.create!(name: "😜")     # wild/ messy
cat12 = Category.create!(name: "😕")     # wtf/ confused
cat13 = Category.create!(name: "👮")     # police
cat14 = Category.create!(name: "🎅")     # christmas 
cat15 = Category.create!(name: "👯")     # dancing girls
cat16 = Category.create!(name: "💇")     # haircut
cat17 = Category.create!(name: "👰")     # wedding
cat18 = Category.create!(name: "💃")     # dancing
cat19 = Category.create!(name: "👪")     # family
cat20 = Category.create!(name: "👊")     # fighting
cat21 = Category.create!(name: "👅")     # cheeky
cat22 = Category.create!(name: "💋")     # flirty
cat23 = Category.create!(name: "🙈")     # cringe/ embarassed
cat24 = Category.create!(name: "🐶")     # dog/ pet related
cat25 = Category.create!(name: "🐱")     # cat/ pet related
cat26 = Category.create!(name: "🐯")     # kinky/ cheeky 
cat27 = Category.create!(name: "🐎")     # horse racing/ equestrian
cat28 = Category.create!(name: "🐮")     # cow
cat29 = Category.create!(name: "🐷")     # pig/ greedy
cat30 = Category.create!(name: "🐗")     # such a bore(!)
cat31 = Category.create!(name: "🐽")     # greedy/ smelly
cat32 = Category.create!(name: "🐘")     # elephant
cat33 = Category.create!(name: "🐪")     # camel




# Locations
loc1 = Location.create!(name: "London")
loc2 = Location.create!(name: "Paris")
