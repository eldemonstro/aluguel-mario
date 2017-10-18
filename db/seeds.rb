# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
property_type = PropertyType.create(name: 'Apartamento na praia')
Property.create(title: 'Sitio legal', area: '300m2',
                location: 'Juquitiba', description: 'Bem grande',
                daily_rate: 800.55, rooms: 12, minimum_rent_days: 3,
                maximum_rent_days: 14, photo: 'photo_boa2.jpg',
                maximum_occupancy: 15, usage_rules: 'Não pode criança',
                property_type: property_type)
