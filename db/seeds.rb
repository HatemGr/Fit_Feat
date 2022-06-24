# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Message.destroy_all
Notification.destroy_all
Participation.destroy_all
Event.destroy_all
RunningPerformance.all.destroy_all
TennisPerformance.all.destroy_all
WorkoutPerformance.all.destroy_all
ClimbingPerformance.all.destroy_all
User.all.destroy_all
City.all.destroy_all
SportUser.all.destroy_all
User.all.destroy_all
Sport.all.destroy_all

paris = City.create(name: 'Paris', image_url: 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80')
City.create(name: 'Colombes', image_url: 'https://images.unsplash.com/photo-1639409392973-2134fbb44f3f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y29sb21iZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60')
City.create(name: 'Marseille', image_url: 'https://images.unsplash.com/photo-1566838217578-1903568a76d9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWFyc2VpbGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')
toulouse = City.create(name: 'Toulouse', image_url: 'https://images.unsplash.com/photo-1563517987331-3839f534b807?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8dG91bG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60')
lille = City.create(name: 'Lille', image_url: 'https://images.france.fr/zeaejvyq9bhj/4lykvx2hoI6YksIo0YOiwe/9958cc7c0b4ca3d4efb16b8e7f49fbac/Grand_Place__OTCL_Lille_-_Laurent_Ghesqui__re.jpg?w=1120&h=490&q=70&fm=webp&fit=fill')

User.create(email: 'jf@yopmail.com', password: 'password', first_name: 'Joffrey', last_name: 'Frexinet', city: toulouse,
            address: 'Rue des lois',is_admin: true)
User.create(email: 'fb@yopmail.com', password: 'password', first_name: 'Foucaut', last_name: 'Beaumont', city: lille,
            address: 'Rue Massena',is_admin: true)
User.create(email: 'hg@yopmail.com', password: 'password', first_name: 'Hatem', last_name: 'Gribi', city: paris,
            address: 'Avenue des Champs Elysees',is_admin: true)
User.create(email: 'll@yopmail.com', password: 'password', first_name: 'Lydia', last_name: 'Valena', city: toulouse,
            address: 'Place de Capitole',is_admin: true)

puts 'Team created'

adresses = ['34 Boulevard de Clichy', '29 Rue Vieille du Temple', '40 Rue Notre-Dame de Lorette', '54 Rue Saint-Denis',
            "1-5 Rue d'Argentine", '11 Rue de Cambrai',
            '21 Rue Andre del Sarte', '147 Boulevard Lefebvre', '32 Rue de la Rochefoucauld']

adresses.each do |address|
  prenom = Faker::Name.first_name
  User.create(email: "#{prenom}@thp.com", password: 'password', first_name: prenom, last_name: Faker::Name.last_name,
              address: address, city: paris)
  puts 'User created'
end

Sport.create(name: 'Running')
Sport.create(name: 'Workout')
Sport.create(name: 'Futsal')
Sport.create(name: 'Climbing')
Sport.create(name: 'Tennis')
puts 'Sports created'

block_colors = %w[vert bleu rouge violet orange]
levels = [5, 6, 7, 8]
ranks = ['6', '15/1', '15/2', '15/3', '15/4', '15/5', '30', '30/1', '30/2', '30/3', '30/4', '40']

benchpress_weights = [10, 20, 50, 60, 80, 100]
squat_weights = [20, 40, 60, 80, 100, 120]

User.all.each do |user|
  rand(1..3).times do
    sport = Sport.all.sample
    sport_user = SportUser.new(sport: sport, user: user, experience: rand(0..10), frequency: rand(1..5))
    next unless sport_user.save

    puts 'SportUser created'
    case sport.name
    when 'Climbing'
      ClimbingPerformance.create!(sport_user: sport_user,
                                  block_color: block_colors.sample, level: levels.sample)
      puts 'Climbing perf created'
    when 'Running'
      RunningPerformance.create!(sport_user: sport_user, distance: rand(5..50), speed: rand(5..18))
      puts 'Running perf created'
    when 'Tennis'
      TennisPerformance.create!(sport_user: sport_user, rank: ranks.sample)
      puts 'Tennis perf created'
    else
      WorkoutPerformance.create!(sport_user: sport_user, benchpress_weight: benchpress_weights.sample,
                                 squat_weight: squat_weights.sample)
      puts 'Workout perf created'
    end
  end
end

adresses[0..4].each do |address|
  Event.create!(admin: User.all.sample,
                sport: Sport.all.sample,
                title: Faker::Sports::Football.competition,
                date: Faker::Time.between(from: DateTime.now + 500, to: DateTime.now + 30_000, format: :long),
                city: City.first,
                address: address)
end

'Events created'

50.times do
  Participation.create(event: Event.all.sample, user: User.all.sample)
end
puts 'Seed performed!'
