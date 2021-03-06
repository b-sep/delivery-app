require 'rails_helper'

describe 'admin visualiza preços dos fretes' do
  it 'com sucesso' do
    admin = Admin.create!(email: 'jr@deliveryapp.com', password: '123456')

    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: 'active')

    hauler3 = Hauler.create!(brand_name: 'Transporte 3111', corporate_name: 'Transporte LTDA3', registration_number: '00000200000000', address: 'qnd 05', email_domain: 'transporte3.com.br', status: 'active')

    Price.create!(min_cubic_meter: 0.001, max_cubic_meter: 0.500, min_weight: 1, max_weight: 20, km_price: 2, hauler: hauler)

    Price.create!(min_cubic_meter: 0.001, max_cubic_meter: 0.500, min_weight: 1, max_weight: 20, km_price: 4, hauler: hauler3)

    DeliveryDate.create!(distance_1: 0, distance_2: 100, days: 1, hauler: hauler)

    DeliveryDate.create!(distance_1: 0, distance_2: 100, days: 9, hauler: hauler3)

    login_as(admin, :scope => :admin)
    visit admin_delivery_app_path
    click_on 'Orçamento'
    fill_in 'Altura', with: 91
    fill_in 'Largura', with: 74
    fill_in 'Profundidade', with: 39
    fill_in 'Peso', with: 1
    fill_in 'Distancia', with: 99
    fill_in 'Endereço', with: 'Pompeia, São Paulo'
    fill_in 'Solicitante', with: 'Júnior'
    click_on 'CONSULTAR'
    
    expect(page).to have_content 'Transportadora: Transporte 322'
    expect(page).to have_content 'Volume do pacote: 0.262626m³'
    expect(page).to have_content 'Endereço: Pompeia, São Paulo'
    expect(page).to have_content 'Distância: 99kms'
    expect(page).to have_content 'Peso: 1.0kg'
    expect(page).to have_content 'Valor total: R$ 198,00 reais'
    expect(page).to have_content 'Prazo: 1 dia'
    expect(page).to have_content 'Solicitante: Júnior'

    expect(page).to have_content 'Transportadora: Transporte 3111'
    expect(page).to have_content 'Volume do pacote: 0.262626m³'
    expect(page).to have_content 'Endereço: Pompeia, São Paulo'
    expect(page).to have_content 'Distância: 99kms'
    expect(page).to have_content 'Valor total: R$ 396,00 reais'
    expect(page).to have_content 'Prazo: 9 dias'
    expect(page).to have_content 'Solicitante: Júnior'
  end

  it 'e não existe transportadora ativa' do
    admin = Admin.create!(email: 'jr@deliveryapp.com', password: '123456')

    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

    Price.create!(min_cubic_meter: 0.001, max_cubic_meter: 0.500, min_weight: 1, max_weight: 20, km_price: 2, hauler: hauler)


    login_as(admin, :scope => :admin)
    visit admin_delivery_app_path
    click_on 'Orçamento'
    fill_in 'Altura', with: 91
    fill_in 'Largura', with: 74
    fill_in 'Profundidade', with: 39
    fill_in 'Peso', with: 8
    fill_in 'Distancia', with: 99
    fill_in 'Endereço', with: 'Pompeia, São Paulo'
    fill_in 'Solicitante', with: 'Júnior'
    click_on 'CONSULTAR'

    expect(page).to have_content 'Nenhuma transportadora ativa'
  end

  it 'e as dimensões da encomenda não atendem as configurações da transportadora' do
    admin = Admin.create!(email: 'jr@deliveryapp.com', password: '123456')

    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: 'active')

    Price.create!(min_cubic_meter: 0.001, max_cubic_meter: 0.500, min_weight: 1, max_weight: 20, km_price: 2, hauler: hauler)

    DeliveryDate.create!(distance_1: 0, distance_2: 100, days: 1, hauler: hauler)

    login_as(admin, :scope => :admin)
    visit admin_delivery_app_path
    click_on 'Orçamento'
    fill_in 'Altura', with: 1000
    fill_in 'Largura', with: 1000
    fill_in 'Profundidade', with: 1000
    fill_in 'Peso', with: 8
    fill_in 'Distancia', with: 99
    fill_in 'Endereço', with: 'São paulo'
    fill_in 'Solicitante', with: 'Júnior'
    click_on 'CONSULTAR'

    expect(page).to have_content 'Transportadora Transporte 322 não é capaz de realizar esse pedido'
  end

  it 'e nenhuma transportadora atende determinada distância' do
    admin = Admin.create!(email: 'jr@deliveryapp.com', password: '123456')

    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: 'active')

    Price.create!(min_cubic_meter: 0.001, max_cubic_meter: 0.500, min_weight: 1, max_weight: 20, km_price: 2, hauler: hauler)

    DeliveryDate.create!(distance_1: 0, distance_2: 100, days: 1, hauler: hauler)

    login_as(admin, :scope => :admin)
    visit admin_delivery_app_path
    click_on 'Orçamento'
    fill_in 'Altura', with: 30
    fill_in 'Largura', with: 20
    fill_in 'Profundidade', with: 40
    fill_in 'Peso', with: 8
    fill_in 'Distancia', with: 200
    fill_in 'Endereço', with: 'São paulo'
    fill_in 'Solicitante', with: 'Júnior'
    click_on 'CONSULTAR'

    expect(page).to have_content 'Transportadora Transporte 322 não é capaz de realizar esse pedido'
  end

  it 'e não aparece preço de transportadora inativa' do
    admin = Admin.create!(email: 'jr@deliveryapp.com', password: '123456')

    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: 'active')

    hauler3 = Hauler.create!(brand_name: 'Transporte 3111', corporate_name: 'Transporte LTDA3', registration_number: '00000200000000', address: 'qnd 05', email_domain: 'transporte3.com.br')

    Price.create!(min_cubic_meter: 0.001, max_cubic_meter: 0.500, min_weight: 1, max_weight: 20, km_price: 2, hauler: hauler)

    Price.create!(min_cubic_meter: 0.001, max_cubic_meter: 0.500, min_weight: 1, max_weight: 20, km_price: 4, hauler: hauler3)

    DeliveryDate.create!(distance_1: 0, distance_2: 100, days: 1, hauler: hauler)

    DeliveryDate.create!(distance_1: 0, distance_2: 100, days: 9, hauler: hauler3)

    login_as(admin, :scope => :admin)
    visit admin_delivery_app_path
    click_on 'Orçamento'
    fill_in 'Altura', with: 91
    fill_in 'Largura', with: 74
    fill_in 'Profundidade', with: 39
    fill_in 'Peso', with: 1
    fill_in 'Distancia', with: 99
    fill_in 'Endereço', with: 'Pompeia, São Paulo'
    fill_in 'Solicitante', with: 'Júnior'
    click_on 'CONSULTAR'

    expect(page).to have_content 'Valor total: R$ 198,00 reais'
    expect(page).to have_content 'Transporte 322'
    expect(page).not_to have_content 'Transporte 3111'
    expect(page).not_to have_content 'Valor total: R$ 396,00 reais'
  end
  
  it 'e precisa estar logado para fazer consulta' do
    visit admin_haulers_path

    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
end