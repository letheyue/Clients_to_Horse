# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

owner1 = Owner.create({:name => 'Bruce Wayne', :address => 'Gotham', :phone_number => '702-858-0266', :fax_number =>  '702-858-0266', :email => 'batman@gmail.com', :comments => 'because I am batman', :balance => 0})
horse1 = owner1.horses.create({:name => 'Hurry', :age => "2", :sex => 'F', :breed => 'Red'})

owner2 = Owner.create({:name => 'Clark Kent', :address => 'Metropolis', :phone_number => '702-858-0267', :fax_number =>  '702-858-0267', :email => 'superman@gmail.com', :comments => 'save martha', :balance => 0})
horse2 = owner2.horses.create( {:name => 'Larry', :age => "1.5", :sex => 'M', :breed => 'Rare'})

owner3 = Owner.create({:name => 'Dianna Prince', :address => 'Amazon', :phone_number => '702-858-0268', :fax_number =>  '702-858-0268', :email => 'wonderwoman@gmail.com', :comments => 'I am the daughter of amazon', :balance => 0})
horse3 = owner3.horses.create({:name => 'Barry', :age => "1", :sex => 'M', :breed => 'Alien'})

owner4 = Owner.create({:name => 'test1', :address => 'College Station', :phone_number => '702-858-5598', :fax_number =>  '702-858-5598', :email => 'letheyuetemp@gmail.com', :comments => 'test owner', :balance => 0})
horse4 = owner4.horses.create({:name => 'Curry', :age => "0.5", :sex => 'F', :breed => 'Red'})

user = User.create({:name => 'admin', :email => 'test@sample.com', :password => '123456'})

activity1 = Activity.create({:name => 'ICSI', :price => 1250, :comment => ""})
activity2 = Activity.create({:name => 'Day 5 Cleavage Check', :price => 500, :comment => "500 per embryo"})
activity3 = Activity.create({:name => 'Day 7', :price => 500, :comment => "500 per embryo"})
activity4 = Activity.create({:name => 'Day 8', :price => 500, :comment => "500 per embryo"})
activity5 = Activity.create({:name => 'Day 9', :price => 500, :comment => "500 per embryo"})
activity6 = Activity.create({:name => 'Day 10', :price => 500, :comment => "500 per embryo"})
activity7 = Activity.create({:name => 'PM Ovary dissection', :price => 500, :comment => ""})
activity8 = Activity.create({:name => 'Maturation', :price => 0, :comment => ""})


procedure_1 = Procedure.create({:name => 'In-Vivo Oocytes'})
procedure_2 = Procedure.create({:name => 'In-Vivo SAME DAY Oocytes'})
procedure_3 = Procedure.create({:name => 'Post Mortem Ovaries'})
procedure_4 = Procedure.create({:name => 'Shipped Immature Oocytes'})

chain_1 = Chain.create([{:procedure_id => procedure_1.id, :activity_id => activity1.id, :activity_order => 0, :comment =>"120 per horse"}, {:procedure_id => procedure_1.id, :activity_id => activity2.id, :activity_order => 1, :comment =>"100 per activity"}])
chain_2 = Chain.create([{:procedure_id => procedure_2.id, :activity_id => activity1.id, :activity_order => 0}, {:procedure_id => procedure_2.id, :activity_id => activity3.id, :activity_order => 2}])
chain_3 = Chain.create([{:procedure_id => procedure_3.id, :activity_id => activity2.id, :activity_order => 0}, {:procedure_id => procedure_3.id, :activity_id => activity3.id, :activity_order => 3}])

horse1_activities = HorseActivity.create([{:activity_id => activity1.id, :procedure_id => procedure_1.id,  :horse_id => horse1.id, :date => DateTime.new(2017, 6, 22), :status => 1, :price => 100,  :comment => "member to check embryo"}, {:activity_id => activity2.id, :procedure_id => procedure_1.id, :horse_id => horse1.id, :date => DateTime.new(2017, 7, 22), :status => 1, :price => 50}])
horse2_activities = HorseActivity.create([{:activity_id => activity2.id, :procedure_id => procedure_2.id, :horse_id => horse2.id, :date => DateTime.new(2017, 4, 23), :status => 1, :price => 120}, {:activity_id => activity3.id, :procedure_id => procedure_2.id, :horse_id => horse2.id, :date => DateTime.new(2017, 4, 25), :status => 1, :comment => "keep cold", :price => 100}])
horse3_activities = HorseActivity.create([{:activity_id => activity1.id, :procedure_id => procedure_3.id, :horse_id => horse3.id, :date => DateTime.new(2017, 4, 24), :status => 2, :price => 50}, {:activity_id => activity3.id,  :procedure_id => procedure_3.id, :horse_id => horse3.id, :date => DateTime.new(2017, 4, 25), :status => 2, :price => 120}])
