# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
property_type_1 = PropertyType.create(name: 'Casa de campo')
property = Property.create(title: 'Casa de campo para férias',
                          location: 'Campos do Jordão', area: '100m²',
                          description: 'Bela casa com piscina',
                          daily_rate: 600, rooms: 4, minimum_rent_days: 3,
                          maximum_rent_days: 15, photo: 'casa.jpg',
                          maximum_occupancy: 10, usage_rules: 'sem animais',
                          property_type: property_type_1)

property_type = PropertyType.create(name: 'Apartamento na praia')
Property.create(title: 'Sitio legal', area: '300m2',
                location: 'Juquitiba', description: 'Bem grande',
                daily_rate: 800.55, rooms: 12, minimum_rent_days: 3,
                maximum_rent_days: 14, photo: 'photo_boa2.jpg',
                maximum_occupancy: 15, usage_rules: 'Não pode criança',


property = Property.create(title: 'Sitio legal', area: '300m2',
                location: 'Juquitiba', description: 'Bem grande',
                daily_rate: 800.55, rooms: 12, minimum_rent_days: 3,
                maximum_rent_days: 14, photo: 'photo_boa2.jpg',
                maximum_occupancy: 15, usage_rules: 'Não pode criança',
                property_type: property_type)

property_2 = Property.create(title: 'Sitio Nao tao legal', area: '300m2',
                location: 'Juquitiba', description: 'Bem grande',
                daily_rate: 800.55, rooms: 12, minimum_rent_days: 3,
                maximum_rent_days: 14, photo: 'photo_boa2.jpg',
                maximum_occupancy: 15, usage_rules: 'Não pode criança',
                property_type: property_type)

property_3 = Property.create(title: 'Sitio definitivamente nao legal', area: '300m2',
                location: 'Juquitiba', description: 'Bem grande',
                daily_rate: 800.55, rooms: 12, minimum_rent_days: 3,
                maximum_rent_days: 14, photo: 'photo_boa2.jpg',
                maximum_occupancy: 15, usage_rules: 'Não pode criança',
                property_type: property_type)

Proposal.create(user_name: 'Antonio', email: 'a@a.com',
             start_date: '01/01/2017', end_date: '07/01/2017',
             total_guests: 5, purpose: 'ferias da familia',
             property: property, accept_usage_rules: true)
Proposal.create(user_name: 'Antonio', email: 'a@a.com',
              start_date: '11/01/2017', end_date: '17/01/2017',
              total_guests: 5, purpose: 'ferias da familia',
              property: property_2, accept_usage_rules: true)
Proposal.create(user_name: 'Antonio', email: 'a@a.com',
               start_date: '21/01/2017', end_date: '27/01/2017',
               total_guests: 5, purpose: 'ferias da familia',
               property: property_3, accept_usage_rules: true)
