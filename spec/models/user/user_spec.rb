require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'valid?' do
    context 'presence' do
      it 'retorna falso se o nome estiver em branco' do
        user = User.new(name: '', email: 'teste@teste.com', password: 'senha123', birth_date: '10/04/1992')
        result = user.valid?
        expect(result).to be_falsey
      end

      it 'retorna falso se a data de nascimento estiver em branco' do
        user = User.new(name: 'Roberto', email: 'teste@teste.com', password: 'senha123', birth_date: '')
        result = user.valid?
        expect(result).to be_falsey
      end
    end

    context 'format' do
      it 'retorna falso se o formato do ano for diferente de xxxx' do
        user = User.new(name: 'Júnior', email: 'teste@teste.com', password: 'senha123', birth_date: '10/04/19922')
        result = user.valid?
        expect(result).to be_falsey
      end

      it 'retorna falso se o formato do mês for diferente de xx' do
        user = User.new(name: 'Júnior', email: 'teste@teste.com', password: 'senha123', birth_date: '10/044/1992')
        result = user.valid?
        expect(result).to be_falsey
      end

      it 'retorna falso se o formato do mês for diferente de xx' do
        user = User.new(name: 'Júnior', email: 'teste@teste.com', password: 'senha123', birth_date: '110/04/1992')
        result = user.valid?
        expect(result).to be_falsey
      end
    end
  end
end
