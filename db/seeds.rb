# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding Restaurant'
Restaurant.create(name: 'Naise_restaurant', description: 'naise_naise_atmosphere', location: 'Blk 1, One Avenue, #1-11', time: '10am-11am', certification: 'Halal', category: 'Family-friendly' )
Restaurant.create(name: 'Naise_restaurant1', description: 'naise_naise_atmosphere', location: 'Blk 2, One Avenue, #1-11', time: '10am-11am', certification: 'Halal', category: 'Near Mosque' )
Restaurant.create(name: 'Naise_restaurant2', description: 'naise_naise_atmosphere', location: 'Blk 3, One Avenue, #1-11', time: '10am-11am', certification: 'Halal', category: 'Romantic' )
Restaurant.create(name: 'Naise_restaurant3', description: 'naise_naise_atmosphere', location: 'Blk 4, One Avenue, #1-11', time: '10am-11am', certification: 'Halal', category: 'Budget' )
Restaurant.create(name: 'Naise_restaurant4', description: 'naise_naise_atmosphere', location: 'Blk 5, One Avenue, #1-11', time: '10am-11am', certification: 'Halal', category: 'Family-friendly' )

puts 'Seeding Photos'

Photo.create(title: "My face", restaurant: "Hello", description: "is awesome ", avatar: "10710565_10203107756830947_2095504797211517543_n.j...", tag_list: "handsome, halal", price: 0.1e7, created_at: "2017-11-01 04:28:57", updated_at: "2017-11-01 04:28:57", foody_id: 1)
Photo.create(title: "My faces", restaurant: "Hello", description: "is awesome ", avatar: "10710565_10203107756830947_2095504797211517543_n.j...", tag_list: "handsome, halal", price: 0.1e7, created_at: "2017-11-01 04:28:57", updated_at: "2017-11-01 04:28:57", foody_id: 1)