# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

RunningPerformance.all.destroy_all
TennisPerformance.all.destroy_all
WorkoutPerformance.all.destroy_all
ClimbingPerformance.all.destroy_all
User.all.destroy_all
City.all.destroy_all
SportUser.all.destroy_all
User.all.destroy_all
Sport.all.destroy_all


city = City.create(name:"Paris")

User.create(email: "jf@thp.com", password: "password", first_name:"Joffrey", last_name:"Frexinet", city: city, address: "17 Rue de Rambouillet Paris")
User.create(email: "fb@thp.com", password: "password",first_name:"Foucaut", last_name:"Beaumont", city: city , address: "61 Rue Rodier Paris")
User.create(email: "hg@thp.com", password: "password",first_name:"Hatem", last_name:"Gribi", city: city , address: "27 Rue de Fontarabie Paris" )
User.create(email: "ll@thp.com", password: "password",first_name:"Lydia", last_name:"Valena", city: city , address: "47 Rue de Laborde Paris" )

puts "Team created"

adresses = ["34 Boulevard de Clichy", "29 Rue Vieille du Temple", "40 Rue Notre-Dame de Lorette", "54 Rue Saint-Denis", 
    "1-5 Rue d'Argentine", "11 Rue de Cambrai",
    "21 Rue Andre del Sarte", "147 Boulevard Lefebvre", "32 Rue de la Rochefoucauld", "10 Rue Boulle", "90 Rue de Tolbiac", 
    "100 Rue Saint-Martin", "10 Avenue George V", "12 Rue Marie et Louise", "125 Avenue des Champs-Elysees", "2 Rue Cauchy", "19 Rue Pavee", "28 Boulevard Diderot", "35 Rue de la Grange aux Belles", "88 Rue Blanche", " 	40 Rue Saint-Louis en l'Ile", ]

adresses.each do |address|
    prenom =  Faker::Name.first_name
    User.create(email: "#{prenom}@thp.com", password:"password", first_name: prenom, last_name: Faker::Name.last_name , address: "#{address} Paris", city: city )
    puts "User created"
end

Sport.create(name: "Running")
Sport.create(name: "Workout")
Sport.create(name: "Futsal")
Sport.create(name: "Climbing")
Sport.create(name: "Tennis")
puts "Sports created"

block_colors = ["vert", "bleu", "rouge", "violet", "orange"]
block_colors.each do |color|
  ClimbingBlockColor.create(block_color: color)
end
puts "Climbing colors created"

levels = [5,6,7,8]
levels.each do |level|
  ClimbingLevel.create(level: level)
end
puts "Climbing levels created"

ranks = ["6", "15/1", "15/2", "15/3", "15/4", "15/5", "30", "30/1", "30/2", "30/3", "30/4", "40"]
ranks.each do |rank|
  TennisRank.create(rank:rank)
end
puts "Tennis ranks created"

benchpress_weights = [10, 20, 50, 60, 80, 100]
squat_weights = [20, 40, 60, 80, 100, 120]

User.all.each do |user|
    rand(1..3).times do
        sport = Sport.all.sample
        sport_user = SportUser.new(sport: sport, user: user, experience: rand(0..10), frequency: rand(1..5))
        if sport_user.save
            puts "SportUser created"
            case sport.name
            when "Climbing"
                ClimbingPerformance.create!(sport_user: sport_user, block_color: ClimbingBlockColor.all.sample.block_color, level: ClimbingLevel.all.sample.level )
                puts "Climbing perf created"
            when "Running"
                RunningPerformance.create!(sport_user: sport_user,distance: rand(5..50), speed: rand(5..18))
                puts "Running perf created"
            when "Tennis"
                TennisPerformance.create!(sport_user: sport_user,rank: TennisRank.all.sample.rank)
                puts "Tennis perf created"
            else
                WorkoutPerformance.create!(sport_user: sport_user,benchpress_weight: benchpress_weights.sample, squat_weight: squat_weights.sample)
                puts "Workout perf created"
            end
        end
    end
end

puts "Seed performed!"


