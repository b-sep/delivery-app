require 'rails_helper'

describe 'visitante acessa página inicial' do
  it 'e busca ordem de serviço pelo código com sucesso' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: 'active')
    Vehicle.create!(license_plate: 'jka1234', full_load: 100, car_model: 'Sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)
    order = Order.create!(heigth: 10, depth: 10, width: 20, distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler, status: 'accepted', vehicle_id: 1)
    OrderHistoric.create!(address: 'galpao sp', order: order)

    visit root_path
    fill_in 'search', with: order.code
    click_on 'Rastrear Ordem'

    expect(page).to have_content 'galpao sp'
  end

  it 'e ordem de serviço não tem atualização' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: 'active')
    Vehicle.create!(license_plate: 'jka1234', full_load: 100, car_model: 'Sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)
    order = Order.create!(heigth: 10, depth: 10, width: 20, distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler, status: 'accepted', vehicle_id: 1)

    visit root_path
    fill_in 'search', with: order.code
    click_on 'Rastrear Ordem'

    expect(page).to have_content "Ordem de serviço #{order.code} sem atualização"
  end
  
  it 'e ordem não existe' do

    visit root_path
    fill_in 'search', with: '1123'
    click_on 'Rastrear Ordem'

    expect(page).to have_content 'Ordem de serviço não encontrada'
  end
end