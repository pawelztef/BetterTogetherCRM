# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#

user = User.create(first_name: "pawel", last_name: "stachowicz", email: "p@p.com", password: "password", ownership: true)
5.times do 
  volunteers_group = VolunteersGroup.create(
    name: Faker::Team.creature,
    description: Faker::Lorem.sentence(3) )
end
10.times do
  uers = User.create( 
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password)
end
10.times do 
  volunteer = Volunteer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone1: Faker::PhoneNumber.cell_phone)
  volunteer.volunteers_groups << VolunteersGroup.find(1)
  volunteer.volunteers_groups << VolunteersGroup.find(2)
end
    
