# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.create(name: "The Keg" , max_occupancy: 50, address: '110 Yonge St.', website: 'https://wwww.thekeg.com')
Restaurant.create(name: "McDs" , max_occupancy: 10, address: '10 Yonge St.', website: 'https://wwww.mcds.com')
