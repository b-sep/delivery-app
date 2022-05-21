# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

Admin.create!(email: 'jr@treinadev.com.br', password: '123456')

User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')

Vehicle.create!(license_plate: 'jka1234', full_load: 100, car_model: 'sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)