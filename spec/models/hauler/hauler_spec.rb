require 'rails_helper'

RSpec.describe Hauler, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'retorna falso quando o nome fantasia esta em branco' do
        hauler = Hauler.new(brand_name: '', corporate_name: '3 LTDA', address: 'qnd 3', email_domain: '3ltda.com.br', registration_number: '00000000000000')

        result = hauler.valid?

        expect(result).to be_falsey
      end

      it 'retorna falso quando a razão social esta em branco' do
        hauler = Hauler.new(brand_name: 'Mercadinho', corporate_name: '', address: 'qnd 3', email_domain: '3ltda.com.br', registration_number: '00000000000000')

        result = hauler.valid?

        expect(result).to be_falsey
      end

      it 'retorna falso quando o endereço esta em branco' do
        hauler = Hauler.new(brand_name: 'Mercadinho', corporate_name: '3 LTDA', address: '', email_domain: '3ltda.com.br', registration_number: '00000000000000')

        result = hauler.valid?

        expect(result).to be_falsey
      end

      it 'retorna falso quando o domínio de email esta em branco' do
        hauler = Hauler.new(brand_name: 'Mercadinho', corporate_name: '3 LTDA', address: 'qnd 3', email_domain: '', registration_number: '00000000000000')

        result = hauler.valid?

        expect(result).to be_falsey
      end

      it 'retorna falso quando o CNPJ esta em branco' do
        hauler = Hauler.new(brand_name: 'Mercadinho', corporate_name: '3 LTDA', address: 'qnd 3', email_domain: '3ltda.com.br', registration_number: '')

        result = hauler.valid?

        expect(result).to be_falsey
      end
    end

    context 'length' do
      it 'retorna falso se o CNPJ tiver tamanho menor que 14' do
        hauler = Hauler.new(brand_name: '', corporate_name: '3 LTDA', address: 'qnd 3', email_domain: '3ltda.com.br', registration_number: '0000000000000')
        result = hauler.valid?
        expect(result).to be_falsey
      end

      it 'retorna falso se o CNPJ tiver tamanho maior que 14' do
        hauler = Hauler.new(brand_name: '', corporate_name: '3 LTDA', address: 'qnd 3', email_domain: '3ltda.com.br', registration_number: '000000000000000')
        result = hauler.valid?
        expect(result).to be_falsey
      end

      it 'retorna true se o CNPJ tiver tamanho 14' do
        hauler = Hauler.new(brand_name: 'Mercadinho', corporate_name: '3 LTDA', address: 'qnd 3', email_domain: '3ltda.com.br', registration_number: '00000000000000')
        result = hauler.valid?
        expect(result).to eq true
      end
    end
  end
end
