require 'rails_helper'

RSpec.describe OrderHistoric, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'retorna falso quando o endereço esta em branco' do
        hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', 
                                address: 'qnd 03', email_domain: 'transporte.com.br', status: "active")
        order = Order.create!(heigth: 10, depth: 10, width: 20, distance: 200, weight: 14, price: 400, days: 3, user: 'Júnior', address: 'qs 19', hauler: hauler)
        order_historic = OrderHistoric.new(address: '', order: order)

        expect(order_historic.valid?).to be_falsey
      end
    end
  end
end
