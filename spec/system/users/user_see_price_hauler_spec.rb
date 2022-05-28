require 'rails_helper'

describe 'usuário ve lista de preços da transportadora' do
  it 'com sucesso' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

    hauler2 = Hauler.create!(brand_name: 'Transporte 312', corporate_name: 'Transporte LTDA2', registration_number: '00000100000000', address: 'qnd 04', email_domain: 'transporte2.com.br', status: "active")

    user = User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')

    Price.create!(min_cubic_meter: 0.001, max_cubic_meter: 0.500, min_weight: 1, max_weight: 20, km_price: 2, hauler: hauler)

    Price.create!(min_cubic_meter: 0.500, max_cubic_meter: 1, min_weight: 1, max_weight: 20, km_price: 4, hauler: hauler2)


    login_as user
    visit user_hauler_prices_path(hauler)

    expect(page).to have_content 'Entre 0.001 a 0.5m³ e peso entre 1 e 20kgs o valor é de R$ 2,00 reais por km.'
    expect(page).not_to have_content 'Entre 0.5 a 1.0m³ e peso entre 1 e 20kgs o valor é de R$ 4,00 reais por km.'
  end

  it 'e deve estar logado para ver a lista' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

    visit user_hauler_prices_path(hauler)
    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end

  it 'e não tem nenhum preço cadastrado' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

    user = User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')

    login_as user
    visit user_hauler_prices_path(hauler)

    expect(page).to have_content 'Nenhum preço cadastrado'
  end
end