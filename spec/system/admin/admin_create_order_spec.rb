require 'rails_helper'

describe 'admin cria ordem de serviço' do
  it 'com sucesso' do
    admin = Admin.create!(email: 'jr@deliveryapp.com', password: '123456')

    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', 
                            address: 'qnd 03', email_domain: 'transporte.com.br', status: "active")
    Price.create!(min_cubic_meter: 0.001, max_cubic_meter: 0.500, min_weight: 1, max_weight: 20, km_price: 2, hauler: hauler)
    DeliveryDate.create!(distance_1: 0, distance_2: 100, days: 1, hauler: hauler)

    login_as admin, :scope => :admin
    visit '/admin/delivery-app'
    click_on 'Orçamento'
    fill_in 'Altura', with: 10
    fill_in 'Profundidade', with: 32
    fill_in 'Largura', with: 30
    fill_in 'Peso', with: 13
    fill_in 'Distancia', with: 80
    fill_in 'Endereço', with: 'qs 19'
    fill_in 'Solicitante', with: 'Júnior'
    click_on 'CONSULTAR'
    click_on 'Registrar ordem de serviço Transporte 322'

    expect(page).to have_content Order.last.code
    expect(page).to have_content 'Ordem registrada com sucesso'
    expect(page).to have_content 'Transportadora: Transporte 322'
    expect(page).to have_content 'Volume do pacote: 0.0096m³'
    expect(page).to have_content 'Endereço: qs 19'
    expect(page).to have_content 'Distância: 80kms'
    expect(page).to have_content 'Prazo de entrega: 1 dia'
    expect(page).to have_content 'Peso: 13kgs'
    expect(page).to have_content 'Valor total: R$ 160,00'
    expect(page).to have_content 'Status: Pendente'
    expect(current_path).to eq '/admin/orders/1'
    expect(Order.last).to eq hauler.orders.last
  end
end