# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.create(name: "The Keg", max_occupancy: 50, address: '110 Yonge St.', website: 'https://kegsteakhouse.com', cuisine: 'Steakhouse')
Restaurant.create(name: "Red Lobster" , max_occupancy: 75, address: '10 Yonge St.', website: 'https://www.redlobster.ca/', cuisine: 'Seafood')
Restaurant.create(name: "Los Colibris", max_occupancy: 60, address: '220 King St. W.', website: 'http://www.loscolibris.ca/', cuisine: 'Mexican')
Restaurant.create(name: "Pizzeria Libretto", max_occupancy: 86, address: '221 Ossington Ave.', website: 'http://pizzerialibretto.com/', cuisine: 'Italian')
Restaurant.create(name: "Byblos", max_occupancy: 35, address: '11 Duncan St.', website: 'http://byblostoronto.com/', cuisine: 'Mediterranean')
Restaurant.create(name: "Jacobs & Co. Steakhouse", max_occupancy: 50, address: '12 Brant St.', website: 'http://jacobssteakhouse.com/', cuisine: 'Steakhouse')

Superuser.create(name: "admin", phone: "1111111111", email: "admin@admin.com", password: "admin", password_confirmation: "admin")

User.create(name: "admin", phone: "1111111111", email: "test@admin.com", password: "admin", password_confirmation: "admin")
