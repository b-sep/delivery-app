#transportadoras
hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', 
                        address: 'qnd 03', email_domain: 'transporte.com.br', status: "active")
hauler2 = Hauler.create!(brand_name: 'Transporte 312', corporate_name: 'Transporte LTDA2', registration_number: '00000100000000',
                         address: 'qnd 04', email_domain: 'transporte2.com.br', status: "active")

#admin
Admin.create!(email: 'jr@deliveryapp.com', password: '123456')

#usuário da transportadora
User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')

#veículo
Vehicle.create!(license_plate: 'jka1234', full_load: 100, car_model: 'Sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)
Vehicle.create!(license_plate: 'aaa2354', full_load: 200, car_model: 'Honda Civic', year: '2022', vehicle_brand: 'Honda', hauler: hauler2)

#preços
Price.create!(min_cubic_meter: 0.001, max_cubic_meter: 0.500, min_weight: 1, max_weight: 20, km_price: 2, hauler: hauler)
Price.create!(min_cubic_meter: 0.001, max_cubic_meter: 0.500, min_weight: 21, max_weight: 40, km_price: 4, hauler: hauler)
Price.create!(min_cubic_meter: 0.501, max_cubic_meter: 1.000, min_weight: 21, max_weight: 40, km_price: 4, hauler: hauler)

Price.create!(min_cubic_meter: 0.001, max_cubic_meter: 0.500, min_weight: 1, max_weight: 20, km_price: 1.4, hauler: hauler2)
Price.create!(min_cubic_meter: 0.501, max_cubic_meter: 1.000, min_weight: 21, max_weight: 40, km_price: 3.5, hauler: hauler2)

#prazos
DeliveryDate.create!(distance_1: 0, distance_2: 100, days: 1, hauler: hauler)
DeliveryDate.create!(distance_1: 101, distance_2: 200, days: 3, hauler: hauler)
DeliveryDate.create!(distance_1: 201, distance_2: 400, days: 10, hauler: hauler)

DeliveryDate.create!(distance_1: 0, distance_2: 100, days: 2, hauler: hauler2)
DeliveryDate.create!(distance_1: 101, distance_2: 200, days: 4, hauler: hauler2)

#ordens
order = Order.create!(heigth: 10, depth: 10, width: 20, distance: 200, weight: 14, price: 400, days: 3, user: 'Júnior', address: 'qs 19', hauler: hauler)
order2 = Order.create!(heigth: 20, depth: 35, width: 220, distance: 400, weight: 39, price: 1600, days: 10, user: 'Júnior', address: 'qs 19', hauler: hauler)

#historico da ordem
OrderHistoric.create!(address: 'Centro de distribuição CCD', order: order)
OrderHistoric.create!(address: 'Galpão SSP', order: order)
OrderHistoric.create!(address: 'Correios, Brasília - DF', order: order)

OrderHistoric.create!(address: 'Aeroporto Santos-Dumont', order: order2)
OrderHistoric.create!(address: 'Niterói, Rj', order: order2)
OrderHistoric.create!(address: 'Barra da tijuca, Rj', order: order2)