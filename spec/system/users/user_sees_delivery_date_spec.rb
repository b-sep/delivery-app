require 'rails_helper'

describe 'usuário vê prazos cadastrados' do
  it 'com sucesso' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: "active")
    user = User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')
    DeliveryDate.create!(distance_1: 0, distance_2: 100, days: 1, hauler: hauler)
    DeliveryDate.create!(distance_1: 101, distance_2: 250, days: 3, hauler: hauler)

    login_as user
    visit user_hauler_delivery_dates_path(hauler)

    expect(page).to have_content 'Prazos'
    expect(page).to have_content 'Entre 0 e 100kms, 1 dia'
    expect(page).to have_content 'Entre 101 e 250kms, 3 dias'
  end

  it 'e não existem prazos cadastrados' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: "active")
    user = User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')

    login_as user
    visit user_hauler_delivery_dates_path(hauler)

    expect(page).to have_content 'Nenhum prazo cadastrado.'
  end

  it 'e precisa estar logado para ver prazos' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br', status: "active")
    visit user_hauler_delivery_dates_path(hauler)

    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
end