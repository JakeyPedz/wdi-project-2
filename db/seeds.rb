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
cat34 = Category.create!(name: "🐰")     # rabbit/ easter
cat35 = Category.create!(name: "🐔")     # chicken
cat36 = Category.create!(name: "🐣")     # birth/ hatching chicken
cat37 = Category.create!(name: "🐸")     # frog
cat38 = Category.create!(name: "🐍")     # snake
cat39 = Category.create!(name: "🐳")     # whale
cat40 = Category.create!(name: "🐬")     # dolphin
cat41 = Category.create!(name: "🐟")     # fish
cat42 = Category.create!(name: "🐜")     # ant
cat43 = Category.create!(name: "🐝")     # bee
cat44 = Category.create!(name: "🌺")     # flower
cat45 = Category.create!(name: "💐")     # bouquet
cat46 = Category.create!(name: "🌹")     # rose
cat47 = Category.create!(name: "🌴")     # palm tree/ paradise
cat48 = Category.create!(name: "🌲")     # tree
cat49 = Category.create!(name: "🌳")     # bushy tree
cat50 = Category.create!(name: "🌵")     # cactus
cat51 = Category.create!(name: "🌿")     # herb
cat52 = Category.create!(name: "🍀")     # good luck/ 4 leaf clover 
cat53 = Category.create!(name: "🌻")     # sunflower
cat54 = Category.create!(name: "🌱")     # seedling/ growth
cat55 = Category.create!(name: "🍂")     # Autumn
cat56 = Category.create!(name: "🌍")     # global
cat57 = Category.create!(name: "🌊 ")    # waves/ wavey/ surfing
cat58 = Category.create!(name: "🌕")     # full moon
cat59 = Category.create!(name: "🌙")     # moon
cat60 = Category.create!(name: "☀️")     # sunny
cat61 = Category.create!(name: "☁️")     # cloud/ morbid/ depressing  
cat62 = Category.create!(name: "🌞")     # smiling sun
cat63 = Category.create!(name: "☂")     # umbrella/ raining
cat64 = Category.create!(name: "❄️")      # snow       
cat65 = Category.create!(name: "🌠")     # shooting star
cat66 = Category.create!(name: "🔥")     # fire
cat67 = Category.create!(name: "⚡")     # lightening 
cat68 = Category.create!(name: "⭐")     # star
cat69 = Category.create!(name: "🍇")     # grapes
cat70 = Category.create!(name: "🍋")     # lemon
cat71 = Category.create!(name: "🍉")     # watermelon
cat72 = Category.create!(name: "🍌")     # banana
cat73 = Category.create!(name: "🍊")     # orange/ tangerine







# Locations
loc1 = Location.create!(name: "London")
loc2 = Location.create!(name: "Paris")
