# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

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

adresses = ["100 Rue Saint-Martin", "10 Avenue George V", "12 Rue Marie et Louise", "125 Avenue des Champs-Elysees", "2 Rue Cauchy", "19 Rue Pavee", "28 Boulevard Diderot", "35 Rue de la Grange aux Belles", "88 Rue Blanche", " 	40 Rue Saint-Louis en l'Ile"]

adresses.each do |address|
    prenom =  Faker::Name.first_name
    User.create(email: "#{prenom}@thp.com", password:"password", first_name: prenom, last_name: Faker::Name.last_name , address: "#{address} Paris", city: city )
end

Sport.create(name: "Running")
Sport.create(name: "Workout")
Sport.create(name: "Futsal")
Sport.create(name: "Climbing")
Sport.create(name: "Running")


User.all.each do |user|
    3.times do
        SportUser.create(sport: Sport.all.sample, user: user, experience: rand(0..10), frequency: rand(1..5))
    end
end

puts "Seed performed!"


