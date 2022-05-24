require 'rails_helper'

RSpec.describe DeliveryDate, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'retorna falso se a distância 1 estiver em branco' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: "active")
        dd = DeliveryDate.new(distance_1: '', distance_2: 100, days: 1, hauler: hauler)

        expect(dd.valid?).to be_falsey
      end

      it 'retorna falso se a distância 2 estiver em branco' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: "active")
        dd = DeliveryDate.new(distance_1: 1, distance_2: '', days: 1, hauler: hauler)

        expect(dd.valid?).to be_falsey
      end

      it 'retorna falso se os dias estiverem em branco' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: "active")
        dd = DeliveryDate.new(distance_1: 1, distance_2: 2, days: '', hauler: hauler)

        expect(dd.valid?).to be_falsey
      end
    end

    context 'numericality' do
      it 'retorna falso se a distância 1 não for um número' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: "active")
        dd = DeliveryDate.new(distance_1: 'a', distance_2: 100, days: 1, hauler: hauler)

        expect(dd.valid?).to be_falsey
      end

      it 'retorna falso se a distância 2 não for um número' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: "active")
        dd = DeliveryDate.new(distance_1: 1, distance_2: 's', days: 1, hauler: hauler)

        expect(dd.valid?).to be_falsey
      end

      it 'retorna falso se os dias nao forem um número' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: "active")
        dd = DeliveryDate.new(distance_1: 1, distance_2: 1, days: 'a', hauler: hauler)

        expect(dd.valid?).to be_falsey
      end
    end
  end
end
