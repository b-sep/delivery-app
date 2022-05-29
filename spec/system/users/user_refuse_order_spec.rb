require 'rails_helper'

describe 'Usuário recusa ordem de serviço' do
  it 'com sucesso' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

    user = User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')

    Vehicle.create!(license_plate: 'jka1234', full_load: 100, car_model: 'sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)

    order = Order.create!(heigth: 10, depth: 10, width: 20, distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

    login_as user, :scope => :user
    visit user_hauler_path(hauler)
    click_on "Ordem: #{order.code}"
    select 'sandero', from: 'Veículo'
    click_on 'Recusar ordem de serviço'

    expect(page).to have_content 'Ordem de serviço recusada'
    expect(page).to have_content 'Status: Recusada'
  end

  it 'e precisa estar logado' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')
    visit user_hauler_path(hauler)

    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
end