require 'rails_helper'

describe 'Usuário atualiza histórico da ordem' do
  it 'com sucesso' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: "active")

    user = User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')

    Vehicle.create!(license_plate: 'jka1234', full_load: 100, car_model: 'sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)

    order = Order.create!(heigth: 10, depth: 10, width: 20, distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler, vehicle_id: 1, status: "accepted")

    login_as(user, scope: :user)
    visit user_hauler_order_path(hauler, order)
    click_on 'Atualizar ordem de serviço'
    
    fill_in 'Endereço', with: 'Centro de distribuição CBA'
    click_on 'ATUALIZAR'
    

    expect(page).to have_content order.code
    expect(current_path).to eq user_hauler_order_path(hauler, order)
    expect(page).to have_content 'Rota atualizada'
    expect(page).to have_content 'Rastreamento detalhado'
    expect(page).to have_content 'Centro de distribuição CBA'
    expect(page).to have_content (I18n.localize(OrderHistoric.last.created_at, format: :long))
    expect(order.order_historics.last).to eq OrderHistoric.last
  end

  it 'e precisa estar logado' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: "active")

    Vehicle.create!(license_plate: 'jka1234', full_load: 100, car_model: 'sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)

    order = Order.create!(heigth: 10, depth: 10, width: 20, distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler, vehicle_id: 1, status: "accepted")


    visit user_hauler_order_path(hauler, order)

    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
end