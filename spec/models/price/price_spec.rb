require 'rails_helper'

RSpec.describe Price, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'retorna falso quando o mínimo metro cúbico esta em branco' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        price = Price.new(min_cubic_meter: '', max_cubic_meter: 1, min_weight: 1, max_weight: 20, km_price: 4, hauler: hauler)

        expect(price.valid?).to be_falsey
      end

      it 'retorna falso quando o máximo metro cúbico esta em branco' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        price = Price.new(min_cubic_meter: 0.500, max_cubic_meter: '', min_weight: 1, max_weight: 20, km_price: 4, hauler: hauler)

        expect(price.valid?).to be_falsey
      end

      it 'retorna falso quando o peso mínimo esta em branco' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        price = Price.new(min_cubic_meter: 0.500, max_cubic_meter: 1, min_weight: '', max_weight: 20, km_price: 4, hauler: hauler)

        expect(price.valid?).to be_falsey
      end

      it 'retorna falso quando o peso máximo esta em branco' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        price = Price.new(min_cubic_meter: 0.500, max_cubic_meter: 1, min_weight: 1, max_weight: '', km_price: 4, hauler: hauler)

        expect(price.valid?).to be_falsey
      end

      it 'retorna falso quando o preço por km esta em branco' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        price = Price.new(min_cubic_meter: 0.500, max_cubic_meter: 1, min_weight: 1, max_weight: 5, km_price: '', hauler: hauler)

        expect(price.valid?).to be_falsey
      end
    end

    context 'numericality' do
      it 'retorna falso quando o mínimo metro cúbico não é um número' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        price = Price.new(min_cubic_meter: 'a', max_cubic_meter: 1, min_weight: 1, max_weight: 20, km_price: 4, hauler: hauler)

        expect(price.valid?).to be_falsey
      end

      it 'retorna falso quando o máximo metro cúbico não é um número' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        price = Price.new(min_cubic_meter: 1, max_cubic_meter: 'a', min_weight: 1, max_weight: 20, km_price: 4, hauler: hauler)

        expect(price.valid?).to be_falsey
      end

      it 'retorna falso quando o peso mínimo não é um número' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        price = Price.new(min_cubic_meter: 1, max_cubic_meter: 2, min_weight: 'a', max_weight: 20, km_price: 4, hauler: hauler)

        expect(price.valid?).to be_falsey
      end

      it 'retorna falso quando o peso máximo não é um número' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        price = Price.new(min_cubic_meter: 1, max_cubic_meter: 2, min_weight: 3, max_weight: 'a', km_price: 4, hauler: hauler)

        expect(price.valid?).to be_falsey
      end

      it 'retorna falso quando o preço por km não é um número' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        price = Price.new(min_cubic_meter: 1, max_cubic_meter: 2, min_weight: 3, max_weight: 1, km_price: 'a', hauler: hauler)

        expect(price.valid?).to be_falsey
      end
    end
  end
end
