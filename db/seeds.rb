
loc = Location.new(line1: "A",
                        line2: "Newhaven Bay",
                        city: "Balbriggan",
                        county: "Dublin",
                        code: "XYZ",
                        latitude: 1.11,
                        longitude: 2.22)
user = User.create(first_name: "pawel", last_name: "stachowicz", email: "p@p.com", password: "password", ownership: true)
user.location = loc

5.times do 
  volunteers_group = VolunteersGroup.create(
    name: Faker::Team.creature,
    description: Faker::Lorem.sentence(3) )
end

10.times do |n|
  user = User.create( first_name: Faker::Name.first_name,
                     last_name: Faker::Name.last_name,
                     email: Faker::Internet.email,
                     password: Faker::Internet.password)

  loc = Location.new(line1: "#{127 + n}",
                          line2: "Newhaven Bay",
                          city: "Balbriggan",
                          county: "Dublin",
                          code: "XYZ",
                          latitude: 1.11,
                          longitude: 2.22)

  user.location = loc
end


10.times do |n|
  volunteer = Volunteer.create( first_name: Faker::Name.first_name,
                               last_name: Faker::Name.last_name,
                               email: Faker::Internet.email,
                               phone1: Faker::PhoneNumber.cell_phone)
  volunteer.volunteers_groups << VolunteersGroup.find(1)
  volunteer.volunteers_groups << VolunteersGroup.find(2)

  loc = Location.new(line1: "#{127 + n}",
                          line2: "Newhaven Bay",
                          city: "Balbriggan",
                          county: "Dublin",
                          code: "XYZ",
                          latitude: 1.11,
                          longitude: 2.22)

  volunteer.location = loc
end

5.times do |n|
  clt = Client.create( first_name: Faker::Name.first_name,
                         last_name: Faker::Name.last_name,
                         email: Faker::Internet.email,
                         phone1: Faker::PhoneNumber.cell_phone,
                         phone2: Faker::PhoneNumber.cell_phone,
                         institution: false )

  loc = Location.new(line1: "#{127 + n}",
                          line2: "Newhaven Bay",
                          city: "Balbriggan",
                          county: "Dublin",
                          code: "XYZ",
                          latitude: 1.11,
                          longitude: 2.22)
  
  clt.location = loc
  
  2.times do 
    dog = Dog.create( name: Faker::Pokemon.name,
                       chip_id: Faker::Code.asin,
                       sex: "M",
                       breed: "owczarek",
                       age: Faker::Number.between(1, 15))
    clt.dogs << dog
  end

 
end
5.times do 
 don = Donator.create( first_name: Faker::Name.first_name,
                         last_name: Faker::Name.last_name,
                         email: Faker::Internet.email,
                         phone1: Faker::PhoneNumber.cell_phone,
                         phone2: Faker::PhoneNumber.cell_phone,
                         institution: false )
  donation = Donation.create(transaction_id: Faker::Code.asin,
                             amount: Faker::Number.decimal(2))
  don.donations << donation
end
