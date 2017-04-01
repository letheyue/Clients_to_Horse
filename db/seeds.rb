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

owner4 = Owner.create({:name => 'test1', :address => 'College Station', :phone_number => '702-858-5598', :fax_number =>  '702-858-5598', :email => 'letheyuetemp@gmail.com', :comments => 'test owner'})
horse4 = owner3.horses.create({:name => 'Curry', :age => "0.5", :sex => 'F', :breed => 'Red'})

user = User.create({:name => 'admin', :email => 'test@sample.com', :password => '123456'})

activity1 = Activity.create({:name => 'act1', :price => 150, :comment => "per horse"})
activity2 = Activity.create({:name => 'act2', :price => 100, :comment => "per sperm"})
activity3 = Activity.create({:name => 'act3', :price => 120, :comment => "doesn't matter"})

horse1_activities = HorseActivity.create([{:activity_id => activity1.id, :horse_id => horse1.id, :date => DateTime.new(2015, 6, 22), :status => 1, :comment => "member to check embryo"}, {:activity_id => activity2.id, :horse_id => horse1.id, :date => DateTime.new(2015, 7, 22), :status => 1}])
horse2_activities = HorseActivity.create([{:activity_id => activity2.id, :horse_id => horse2.id, :date => DateTime.new(2015, 6, 22), :status => 2}, {:activity_id => activity3.id, :horse_id => horse2.id, :date => DateTime.new(2015, 7, 22), :status => 1, :comment => "keep cold"}])
horse3_activities = HorseActivity.create([{:activity_id => activity1.id, :horse_id => horse3.id, :date => DateTime.new(2015, 6, 22), :status => 2}, {:activity_id => activity3.id, :horse_id => horse3.id, :date => DateTime.new(2015, 7, 22), :status => 2}])

procedure_1 = Procedure.create({:name => 'procedure1'})
procedure_2 = Procedure.create({:name => 'procedure2'})
procedure_3 = Procedure.create({:name => 'procedure3'})

chain_1 = Chain.create([{:procedure_id => procedure_1.id, :activity_id => activity1.id, :activity_order => 0}, {:procedure_id => procedure_1.id, :activity_id => activity2.id, :activity_order => 1}])
chain_2 = Chain.create([{:procedure_id => procedure_2.id, :activity_id => activity1.id, :activity_order => 0}, {:procedure_id => procedure_2.id, :activity_id => activity3.id, :activity_order => 2}])
chain_3 = Chain.create([{:procedure_id => procedure_3.id, :activity_id => activity2.id, :activity_order => 0}, {:procedure_id => procedure_3.id, :activity_id => activity3.id, :activity_order => 3}])