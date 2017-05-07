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

user1 = User.create({:name => 'admin', :email => 'test@sample.com', :password => '123456', :smtp_mail => 'letheyuetemp', :smtp_mail_password => 'zpbwruoaxjavcoes'})
user2 = User.create({:name => 'admin2', :email => 'letheyuetemp@gmail.com', :password => '123456789', :smtp_mail => 'letheyuetemp', :smtp_mail_password => 'zpbwruoaxjavcoes'})

activity1 = Activity.create({:name => 'ICSI', :price => 1250, :comment => ""})
activity2 = Activity.create({:name => 'Day 5 Cleavage Check', :price => 500, :comment => "500 per embryo"})
activity3 = Activity.create({:name => 'Day 7', :price => 500, :comment => "500 per embryo"})
activity4 = Activity.create({:name => 'Day 8', :price => 500, :comment => "500 per embryo"})
activity5 = Activity.create({:name => 'Day 9', :price => 500, :comment => "500 per embryo"})
activity6 = Activity.create({:name => 'Day 10', :price => 500, :comment => "500 per embryo"})
activity7 = Activity.create({:name => 'PM Ovary dissection', :price => 500, :comment => ""})
activity8 = Activity.create({:name => 'Maturation', :price => 0, :comment => ""})

activity_5 = Activity.create ({:name => 'Search TVA aspirate - no oocytes recovered', :price => 250, :comment => "250 per mare"} )
activity_6 = Activity.create ({:name => 'Search TVA aspirate - oocytes recovery, oocyte culture for maturation', :price => 350, :comment => "350 per aspirate"})
activity_7 = Activity.create ({:name => 'Post-motem ovary dissection (including oocyte culture for maturation)', :price => 500, :comment => "500 per mare"})
activity_8 = Activity.create ({:name => 'Oocyte processing, culture/maturation for immature oocytes recovered and packaged by referring veterinarian', :price => 250, :comment => "250 per mare"})
activity_9 = Activity.create ({:name => 'Sperm preparation, intracytoplasmic sperm injection', :price => 1250, :comment => "1250 per ICSI"}) 
activity_10 = Activity.create ({:name => 'Processing second sperm type for ICSI in same session', :price => 300, :comment => ""})
activity_11 = Activity.create ({:name => 'Processing third  (or more) sperm type of ICSI in same session', :price => 500, :comment => "500 per sperm type"})
activity_12 = Activity.create ({:name => 'In vitro embryo production/handling', :price => 500, :comment => "500 per transferrable embryo"})
activity_13 = Activity.create ({:name => 'CREDIT for each blastocyst over 3: if more than 3 blastocyst trannsferred per aspiration for no pregnancy at first check', :price => 500, :comment => "500 per blastocytst over 3"})
activity_14 = Activity.create ({:name => 'CREDIT after 3 ICSI attempts on the same mare (6 or more oocytes injected per session) with no blastocyst produced', :price => 0, :comment => "One additional ICSI session with no charge"})
activity_15 = Activity.create ({:name => 'ICSI trial for stallion sperm(minimum 20 oocytes injected with subject and control sperm)', :price => 10000, :comment =>"" })
activity_16 = Activity.create ({:name => 'ICSI trial for mare oocytes: subject mare and control mare at same time as research ISCI performed (per shipment)', :price => 1550, :comment =>"" })
activity_17 = Activity.create ({:name => 'ICSI trial for mare oocytes: oocytes from additional mare at same time, per mare', :price => 500, :comment => "500 per additional mare"})
activity_18 = Activity.create ({:name => 'Preparing ICSI cuts from one straw of frozen semen (includes handling, cryovials canes liquid nitrogen, and transport to and from storage facility)', :price => 200, :comment => ""})
activity_19 = Activity.create ({:name => 'Preparing ICSI cuts (each additional straw from the same stallion handled at the same time)', :price => 50, :comment => "50 per straw"})
activity_20 = Activity.create ({:name => 'Packaging and shipment of embryos via courier (at owner request)', :price =>0 , :comment => "At courier cost"})
activity_21 = Activity.create ({:name => 'Packaging/consigment shipping of embryos(ICSI, biopsied, vertified, or warmed): air or shared courier', :price => 165, :comment => "165 per shippment"})
activity_22 = Activity.create ({:name => 'Packaging/consigment shipping of embryos -- per cliet if more than 1 clients embryos are shipped in the same package by air, or multiple shared courier ', :price => 100, :comment => "100 per client"})
activity_23 = Activity.create ({:name => 'Packaging and shipment of frozen semen/vapor shipper or portable incubator etc', :price => 120, :comment => "120 per shippment"})
activity_24 = Activity.create ({:name => 'Packaging and shipment of frozen semen/vapor shipper or portable incubator etc -- per client if more tha 1 clients empryos/semen are shipped in the same package', :price => 60, :comment => "60 per client per shippment"})
activity_25 = Activity.create ({:name => 'Embryo vitrification', :price => 300, :comment => "300 per embryo"})
activity_26 = Activity.create ({:name => 'Additional embryo vitrified concurrently', :price => 200, :comment => "200 per embryo"})
activity_27 = Activity.create ({:name => 'Embryo micromanipulation for blastocoele collapse (to allow vitrification of embryos > 300 um diameter)', :price => 300, :comment => "300 per embryo"})
activity_28 = Activity.create ({:name => 'Embryo biopsy for genetic diagnosis)', :price => 500, :comment => "500 per embryo"})
activity_29 = Activity.create ({:name => 'Packaging and submission of biopsied cells to genetic laboratory)', :price => 175, :comment => "175 per shipment"})
activity_30 = Activity.create ({:name => 'Warming of vitrified embryos', :price => 150, :comment => "150 per embryo"})
activity_31 = Activity.create ({:name => 'Additional embryo warmed concurrently', :price => 100, :comment => "100 per embryo"})
activity_32 = Activity.create ({:name => 'Processing of tissue for cell culture and cryopreservation -1 line)', :price => 2000, :comment => ""}) 
activity_33 = Activity.create ({:name => 'Processing additonaltissue cell line from same animal for cell sulture and cryopreservation', :price => 1000, :comment => ""}) 
activity_34 = Activity.create ({:name => 'NT trial to determine nuclear status of donor cells with bovinem porcine or equine oocytes -3 replicates', :price => 10000, :comment => ""})


procedure_1 = Procedure.create({:name => 'In-Vivo Oocytes'})
procedure_2 = Procedure.create({:name => 'In-Vivo SAME DAY Oocytes'})
procedure_3 = Procedure.create({:name => 'Post Mortem Ovaries'})
procedure_4 = Procedure.create({:name => 'Shipped Immature Oocytes'})

procedure_5 = Procedure.create({:name => 'Search TVA aspirate - no oocytes recovered'})
procedure_6 = Procedure.create({:name => 'Search TVA aspirate - oocytes recovery, oocyte culture for maturation'})
procedure_7 = Procedure.create({:name => 'Post-motem ovary dissection (including oocyte culture for maturation)'})
procedure_8 = Procedure.create({:name => 'Oocyte processing, culture/maturation for immature oocytes recovered and packaged by referring veterinarian'})
procedure_9 = Procedure.create({:name => 'Sperm preparation, intracytoplasmic sperm injection'})
procedure_10 = Procedure.create({:name => 'Processing second sperm type for ICSI in same session'})
procedure_11 = Procedure.create({:name => 'Processing third  (or more) sperm type of ICSI in same session'})
procedure_12 = Procedure.create({:name => 'In vitro embryo production/handling'})
procedure_13 = Procedure.create({:name => 'CREDIT for each blastocyst over 3: if more than 3 blastocyst trannsferred per aspiration for no pregnancy at first check'})
procedure_14 = Procedure.create({:name => 'CREDIT after 3 ICSI attempts on the same mare (6 or more oocytes injected per session) with no blastocyst produced'})
procedure_15 = Procedure.create({:name => 'ICSI trial for stallion sperm(minimum 20 oocytes injected with subject and control sperm)'})
procedure_16 = Procedure.create({:name => 'ICSI trial for mare oocytes: subject mare and control mare at same time as research ISCI performed (per shipment)'})
procedure_17 = Procedure.create({:name => 'ICSI trial for mare oocytes: oocytes from additional mare at same time, per mare'})
procedure_18 = Procedure.create({:name => 'Preparing ICSI cuts from one straw of frozen semen (includes handling, cryovials canes liquid nitrogen, and transport to and from storage facility) '})
procedure_19 = Procedure.create({:name => 'Preparing ICSI cuts (each additional straw from the same stallion handled at the same time)'})
procedure_20 = Procedure.create({:name => 'Packaging and shipment of embryos via courier (at owner request)'})
procedure_21 = Procedure.create({:name => 'Packaging/consigment shipping of embryos(ICSI, biopsied, vertified, or warmed): air or shared courier'})
procedure_22 = Procedure.create({:name => 'Packaging/consigment shipping of embryos -- per cliet if more than 1 clients embryos are shipped in the same package by air, or multiple shared courier '})
procedure_23 = Procedure.create({:name => 'Packaging and shipment of frozen semen/vapor shipper or portable incubator etc'})
procedure_24 = Procedure.create({:name => 'Packaging and shipment of frozen semen/vapor shipper or portable incubator etc -- per client if more tha 1 clients empryos/semen are shipped in the same package'})
procedure_25 = Procedure.create({:name => 'Embryo vitrification'})
procedure_26 = Procedure.create({:name => 'Additional embryo vitrified concurrently'})
procedure_27 = Procedure.create({:name => 'Embryo micromanipulation for blastocoele collapse (to allow vitrification of embryos > 300 um diameter)'})
procedure_28 = Procedure.create({:name => 'Embryo biopsy for genetic diagnosis'})
procedure_29 = Procedure.create({:name => 'Packaging and submission of biopsied cells to genetic laboratory'})
procedure_30 = Procedure.create({:name => 'Warming of vitrified embryos'})
procedure_31 = Procedure.create({:name => 'Additional embryo warmed concurrently'})
procedure_32 = Procedure.create({:name => 'Processing of tissue for cell culture and cryopreservation -1 line'})
procedure_33 = Procedure.create({:name => 'Processing additonaltissue cell line from same animal for cell sulture and cryopreservation'})
procedure_34 = Procedure.create({:name => 'NT trial to determine nuclear status of donor cells with bovinem porcine or equine oocytes -3 replicates'})
procedure_35 = Procedure.create({:name => 'After hours receipt of oocytes/semen/embryos - placement in culture /storage'})
procedure_36 = Procedure.create({:name => 'After hours receipt of oocytes/semen/embryos - placement in culture /storage per case if more than 1 case material is received at the same time'})
procedure_37 = Procedure.create({:name => 'After hours surcharge for TVA /aspiration/ manipulation for ICSI, biopsy, or vitrification /receipt of ovaries for dissection / receipt of tissue for culture'})
procedure_38 = Procedure.create({:name => 'Discount for A&M/ AgriLife staff/faculty'})
procedure_39 = Procedure.create({:name => 'Surcharge if bill by credit card'})



chain_1 = Chain.create([{:procedure_id => procedure_1.id, :activity_id => activity1.id, :activity_order => 0, :comment => activity1.comment}, {:procedure_id => procedure_1.id, :activity_id => activity2.id, :activity_order => 5, :comment =>activity2.comment}, {:procedure_id => procedure_1.id, :activity_id => activity3.id, :activity_order => 7, :comment =>activity3.comment}, {:procedure_id => procedure_1.id, :activity_id => activity4.id, :activity_order => 8, :comment =>activity4.comment}, {:procedure_id => procedure_1.id, :activity_id => activity5.id, :activity_order => 9, :comment =>activity5.comment}, {:procedure_id => procedure_1.id, :activity_id => activity6.id, :activity_order => 10, :comment =>activity6.comment}])
chain_2 = Chain.create([{:procedure_id => procedure_2.id, :activity_id => activity1.id, :activity_order => 0, :comment => activity1.comment}, {:procedure_id => procedure_2.id, :activity_id => activity2.id, :activity_order => 5, :comment =>activity2.comment}, {:procedure_id => procedure_2.id, :activity_id => activity3.id, :activity_order => 7, :comment =>activity3.comment}, {:procedure_id => procedure_2.id, :activity_id => activity4.id, :activity_order => 8, :comment =>activity4.comment}, {:procedure_id => procedure_2.id, :activity_id => activity5.id, :activity_order => 9, :comment =>activity5.comment}, {:procedure_id => procedure_2.id, :activity_id => activity6.id, :activity_order => 10, :comment =>activity6.comment}])
chain_3 = Chain.create([{:procedure_id => procedure_3.id, :activity_id => activity7.id, :activity_order => 0, :comment => activity7.comment}, {:procedure_id => procedure_3.id, :activity_id => activity8.id, :activity_order => 1, :comment =>activity8.comment}, {:procedure_id => procedure_3.id, :activity_id => activity1.id, :activity_order => 2, :comment =>activity1.comment}, {:procedure_id => procedure_3.id, :activity_id => activity2.id, :activity_order => 7, :comment =>activity2.comment}, {:procedure_id => procedure_3.id, :activity_id => activity3.id, :activity_order => 9, :comment =>activity3.comment}, {:procedure_id => procedure_3.id, :activity_id => activity4.id, :activity_order => 10, :comment =>activity4.comment},{:procedure_id => procedure_3.id, :activity_id => activity5.id, :activity_order => 11, :comment =>activity5.comment}, {:procedure_id => procedure_3.id, :activity_id => activity6.id, :activity_order => 12, :comment =>activity6.comment} ])
chain_4 = Chain.create([{:procedure_id => procedure_4.id, :activity_id => activity8.id, :activity_order => 0, :comment => activity8.comment}, {:procedure_id => procedure_4.id, :activity_id => activity1.id, :activity_order => 1, :comment =>activity1.comment}, {:procedure_id => procedure_4.id, :activity_id => activity2.id, :activity_order => 6, :comment =>activity2.comment}, {:procedure_id => procedure_4.id, :activity_id => activity3.id, :activity_order => 8, :comment =>activity3.comment}, {:procedure_id => procedure_4.id, :activity_id => activity4.id, :activity_order => 9, :comment =>activity4.comment}, {:procedure_id => procedure_4.id, :activity_id => activity5.id, :activity_order => 10, :comment =>activity5.comment}, {:procedure_id => procedure_4.id, :activity_id => activity6.id, :activity_order => 11, :comment =>activity6.comment} ])


chains = [  
    {:procedure_id => procedure_5.id, :activity_id => activity_5.id, :activity_order => 0, :comment => activity_5.comment},
    {:procedure_id => procedure_6.id, :activity_id => activity_6.id, :activity_order => 0, :comment => activity_6.comment},
    {:procedure_id => procedure_7.id, :activity_id => activity_7.id, :activity_order => 0, :comment => activity_7.comment},
    {:procedure_id => procedure_8.id, :activity_id => activity_8.id, :activity_order => 0, :comment => activity_8.comment},
    {:procedure_id => procedure_9.id, :activity_id => activity_9.id, :activity_order => 0, :comment => activity_9.comment},
    {:procedure_id => procedure_10.id, :activity_id => activity_10.id, :activity_order => 0, :comment => activity_10.comment},
    {:procedure_id => procedure_11.id, :activity_id => activity_11.id, :activity_order => 0, :comment => activity_11.comment},
    {:procedure_id => procedure_12.id, :activity_id => activity_12.id, :activity_order => 0, :comment => activity_12.comment},
    {:procedure_id => procedure_13.id, :activity_id => activity_13.id, :activity_order => 0, :comment => activity_13.comment},
    {:procedure_id => procedure_14.id, :activity_id => activity_14.id, :activity_order => 0, :comment => activity_14.comment},
    {:procedure_id => procedure_15.id, :activity_id => activity_15.id, :activity_order => 0, :comment => activity_15.comment},
    {:procedure_id => procedure_16.id, :activity_id => activity_16.id, :activity_order => 0, :comment => activity_16.comment},
    {:procedure_id => procedure_17.id, :activity_id => activity_17.id, :activity_order => 0, :comment => activity_17.comment},
    {:procedure_id => procedure_18.id, :activity_id => activity_18.id, :activity_order => 0, :comment => activity_18.comment},
    {:procedure_id => procedure_19.id, :activity_id => activity_19.id, :activity_order => 0, :comment => activity_19.comment},
    {:procedure_id => procedure_20.id, :activity_id => activity_20.id, :activity_order => 0, :comment => activity_20.comment},
    {:procedure_id => procedure_21.id, :activity_id => activity_21.id, :activity_order => 0, :comment => activity_21.comment},
    {:procedure_id => procedure_22.id, :activity_id => activity_22.id, :activity_order => 0, :comment => activity_22.comment},
    {:procedure_id => procedure_23.id, :activity_id => activity_23.id, :activity_order => 0, :comment => activity_23.comment},
    {:procedure_id => procedure_24.id, :activity_id => activity_24.id, :activity_order => 0, :comment => activity_24.comment},
    {:procedure_id => procedure_25.id, :activity_id => activity_25.id, :activity_order => 0, :comment => activity_25.comment},
    {:procedure_id => procedure_26.id, :activity_id => activity_26.id, :activity_order => 0, :comment => activity_26.comment},
    {:procedure_id => procedure_27.id, :activity_id => activity_27.id, :activity_order => 0, :comment => activity_27.comment},
    {:procedure_id => procedure_28.id, :activity_id => activity_28.id, :activity_order => 0, :comment => activity_28.comment},
    {:procedure_id => procedure_29.id, :activity_id => activity_29.id, :activity_order => 0, :comment => activity_29.comment},
    {:procedure_id => procedure_30.id, :activity_id => activity_30.id, :activity_order => 0, :comment => activity_30.comment},
    {:procedure_id => procedure_31.id, :activity_id => activity_31.id, :activity_order => 0, :comment => activity_31.comment},
    {:procedure_id => procedure_32.id, :activity_id => activity_32.id, :activity_order => 0, :comment => activity_32.comment},
    {:procedure_id => procedure_33.id, :activity_id => activity_33.id, :activity_order => 0, :comment => activity_33.comment},
    {:procedure_id => procedure_34.id, :activity_id => activity_34.id, :activity_order => 0, :comment => activity_34.comment},
    ]
    
chains.each do |chain|
    Chain.create(chain)
end

horse1_activities = HorseActivity.create([{:activity_id => activity1.id, :procedure_id => procedure_1.id,  :horse_id => horse1.id, :date => DateTime.new(2017, 4, 22), :status => 1, :price => 100,  :comment => "member to check embryo"}, {:activity_id => activity2.id, :procedure_id => procedure_1.id, :horse_id => horse4.id, :date => DateTime.new(2017, 5, 22), :status => 1, :price => 50}])