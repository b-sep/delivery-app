require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'retorna falso quando a altura não está preenchida' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        order = Order.new(heigth: '', depth: 10, width: 20, distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

        expect(order.valid?).to be_falsey
      end

      it 'retorna falso quando a profundidade não está preenchida' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        order = Order.new(heigth: 12, depth: '', width: 20, distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

        expect(order.valid?).to be_falsey
      end

      it 'retorna falso quando a largura não está preenchida' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        order = Order.new(heigth: 12, depth: 15, width: '', distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

        expect(order.valid?).to be_falsey
      end

      it 'retorna falso quando a distance não está preenchida' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        order = Order.new(heigth: 12, depth: 15, width: 12, distance: '', weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

        expect(order.valid?).to be_falsey
      end

      it 'retorna falso quando o peso não está preenchido' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        order = Order.new(heigth: 12, depth: 15, width: 12, distance: 100, weight: '', price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

        expect(order.valid?).to be_falsey
      end

      it 'retorna falso quando o preço não está preenchido' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        order = Order.new(heigth: 12, depth: 15, width: 12, distance: 100, weight: 100, price: '', days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

        expect(order.valid?).to be_falsey
      end

      it 'retorna falso quando o dia não está preenchido' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        order = Order.new(heigth: 12, depth: 15, width: 12, distance: 100, weight: 100, price: 15, days: '', user: 'Júnior', address: 'qs 19', hauler: hauler)

        expect(order.valid?).to be_falsey
      end

      it 'retorna falso quando o usuário não está preenchido' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        order = Order.new(heigth: 12, depth: 15, width: 12, distance: 100, weight: 100, price: 15, days: 2, user: '', address: 'qs 19', hauler: hauler)

        expect(order.valid?).to be_falsey
      end

      it 'retorna falso quando o endereço não está preenchido' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        order = Order.new(heigth: 12, depth: 15, width: 12, distance: 100, weight: 100, price: 15, days: 2, user: 'Júnior', address: '', hauler: hauler)

        expect(order.valid?).to be_falsey
      end
    end

    context 'numericality' do
      it 'retorna falso se a altura não for um número' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        order = Order.new(heigth: 'b', depth: 10, width: 20, distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

        expect(order.valid?).to be_falsey
      end

      it 'retorna falso se a profundidade não for um número' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        order = Order.new(heigth: 1, depth: 's', width: 20, distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

        expect(order.valid?).to be_falsey
      end

      it 'retorna falso se a largura não for um número' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        order = Order.new(heigth: 1, depth: 12, width: 'g', distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

        expect(order.valid?).to be_falsey
      end

      it 'retorna falso se a distancia não for um número' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        order = Order.new(heigth: 1, depth: 12, width: 12, distance: 's', weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

        expect(order.valid?).to be_falsey
      end

      it 'retorna falso se o peso não for um número' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        order = Order.new(heigth: 1, depth: 12, width: 12, distance: 112, weight: 's', price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

        expect(order.valid?).to be_falsey
      end

      it 'retorna falso se o preço não for um número' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

        order = Order.new(heigth: 1, depth: 12, width: 12, distance: 112, weight: 12, price: 's', days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

        expect(order.valid?).to be_falsey
      end
    end
  end

  describe '#generate_code' do
    it 'deve gerar um código único quando uma ordem for criada' do
      hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

      order = Order.create!(heigth: 10, depth: 10, width: 20, distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

      expect(order.code.size).to eq 10
      expect(order.code.empty?).to be_falsey
    end
  end

  describe '#cubic_meter' do
    it 'deve retornar o volume cúbico da encomenda' do
      hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

      order = Order.create!(heigth: 10, depth: 10, width: 20, distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

      expect(order.cubic_meter).to eq 0.002
    end
  end
end
