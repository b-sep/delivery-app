require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'retorna falso quando a placa do veículo esta em branco' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        veiculo = Vehicle.new(license_plate: '', full_load: 100, car_model: 'sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)

        expect(veiculo.valid?).to be_falsey
      end

      it 'retorna falso quando a carga máxima do veículo esta em branco' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        veiculo = Vehicle.new(license_plate: '123aaaa', full_load: '', car_model: 'sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)

        expect(veiculo.valid?).to be_falsey
      end

      it 'retorna falso quando o modelo do veículo esta em branco' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        veiculo = Vehicle.new(license_plate: '123aaaa', full_load: 100, car_model: '', year: '2020', vehicle_brand: 'Renault', hauler: hauler)

        expect(veiculo.valid?).to be_falsey
      end

      it 'retorna falso quando o ano do veículo esta em branco' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        veiculo = Vehicle.new(license_plate: '123aaaa', full_load: 100, car_model: 'sandero', year: '', vehicle_brand: 'Renault', hauler: hauler)

        expect(veiculo.valid?).to be_falsey
      end

      it 'retorna falso quando a marca do veículo esta em branco' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        veiculo = Vehicle.new(license_plate: '123aaaa', full_load: 100, car_model: 'sandero', year: '2020', vehicle_brand: '', hauler: hauler)

        expect(veiculo.valid?).to be_falsey
      end


    end

    context 'uniqueness' do
      it 'retorna falso quando a placa do veículo já esta em uso' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        hauler2 = Hauler.create!(brand_name: 'Transporte 323', corporate_name: 'Transporte LTDAA', registration_number: '00000000000001', address: 'qnd 04', email_domain: 'transporte2.com.br')

        Vehicle.create!(license_plate: 'jka1234', full_load: 100, car_model: 'sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)

        veiculo = Vehicle.new(license_plate: 'jka-1234', full_load: 200, car_model: 'clio', year: '2021', vehicle_brand: 'Fiat', hauler: hauler2)

        expect(veiculo.valid?).to be_falsey
      end
    end

    context 'length' do
      it 'retorna falso quando a placa tem tamanho menor que 7' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        veiculo = Vehicle.new(license_plate: '123411', full_load: 100, car_model: 'sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)

        expect(veiculo.valid?).to be_falsey
      end

      it 'retorna falso quando a placa tem tamanho maior que 7' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        veiculo = Vehicle.new(license_plate: '12341111', full_load: 100, car_model: 'sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)

        expect(veiculo.valid?).to be_falsey
      end
    end
  end
end
