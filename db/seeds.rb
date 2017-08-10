# Add seed data here. Seed your database with `rake db:seed`
sophie = Owner.create(name: "Sophie")
sam = Owner.create(name: "Sam")
Pet.create(name: "Maddy", owner: sophie)
Pet.create(name: "Nona", owner: sophie)
Pet.create(name: "Stanley", owner: sam)
Pet.create(name: "Kevin", owner: sam)