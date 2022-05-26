require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe '#change_status_hauler' do
    it 'Status da transportadora para ativo quando todas associações estão presente' do
      hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: 'inactive')

      User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')
      Vehicle.create!(license_plate: 'jka1234', full_load: 100, car_model: 'sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)
      Price.create!(min_cubic_meter: 0.001, max_cubic_meter: 0.500, min_weight: 1, max_weight: 20, km_price: 2, hauler: hauler)
      DeliveryDate.create!(distance_1: 0, distance_2: 100, days: 1, hauler: hauler)

      expect(Hauler.reflect_on_all_associations.map(&:name).count).to eq 4
      expect(hauler.status).to eq 'active'
    end

    it 'Status permanece inativo caso esteja faltando alguma associação' do
      hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: 'inactive')

      User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')
      Vehicle.create!(license_plate: 'jka1234', full_load: 100, car_model: 'sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)
      Price.create!(min_cubic_meter: 0.001, max_cubic_meter: 0.500, min_weight: 1, max_weight: 20, km_price: 2, hauler: hauler)

      expect(hauler.status).to eq 'inactive'
    end
  end
end