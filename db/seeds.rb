# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding Restaurant'
Restaurant.create(name: 'Naise_restaurant', description: 'naise_naise_atmosphere', location: 'Blk 1, One Avenue, #1-11', time: '10am-11am', certification: 'Halal' )
Restaurant.create(name: 'Naise_restaurant1', description: 'naise_naise_atmosphere', location: 'Blk 2, One Avenue, #1-11', time: '10am-11am', certification: 'Halal' )
Restaurant.create(name: 'Naise_restaurant2', description: 'naise_naise_atmosphere', location: 'Blk 3, One Avenue, #1-11', time: '10am-11am', certification: 'Halal' )
Restaurant.create(name: 'Naise_restaurant3', description: 'naise_naise_atmosphere', location: 'Blk 4, One Avenue, #1-11', time: '10am-11am', certification: 'Halal' )
Restaurant.create(name: 'Naise_restaurant4', description: 'naise_naise_atmosphere', location: 'Blk 5, One Avenue, #1-11', time: '10am-11am', certification: 'Halal' )