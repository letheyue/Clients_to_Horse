# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

owner1 = Owner.create({:name => 'Bruce Wayne', :address => 'Gotham', :phone_number => '702-858-0266', :fax_number =>  '702-858-0266', :email => 'batman@gmail.com', :comments => 'because I am batman'})
horse1 = owner1.horses.create({:name => 'Hurry', :age => "2", :sex => 'F', :breed => 'Red'})

owner2 = Owner.create({:name => 'Clark Kent', :address => 'Metropolis', :phone_number => '702-858-0267', :fax_number =>  '702-858-0267', :email => 'superman@gmail.com', :comments => 'save martha'})                              
horse2 = owner2.horses.create( {:name => 'Larry', :age => "1.5", :sex => 'M', :breed => 'Rare'})

owner3 = Owner.create({:name => 'Dianna Prince', :address => 'Amazon', :phone_number => '702-858-0268', :fax_number =>  '702-858-0268', :email => 'wonderwoman@gmail.com', :comments => 'I am the daughter of amazon'})                            
horse3 = owner3.horses.create({:name => 'Barry', :age => "1", :sex => 'M', :breed => 'Alien'})

user = User.create({:name => 'admin', :email => 'test@sample.com', :password => '123456'})