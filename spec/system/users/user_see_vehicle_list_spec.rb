require 'rails_helper'

describe 'usuário visualiza lista de veículos' do
  it 'com sucesso' do
    hauler = Hauler.create!(brand_name: 'Transporte 323', corporate_name: 'Transporte LTDA2', registration_number: '00000000000001', address: 'qnd 02', email_domain: 'transporte2.com.br')

    hauler2 = Hauler.create!(brand_name: 'Transporte 312', corporate_name: 'Transporte LTDA3', registration_number: '00000100000000', address: 'qnd 04', email_domain: 'transporte3.com.br', status: "active")
    user = User.create!(name: 'Júnior', email: 'jr@transporte2.com.br', password: 'treinadev08', birth_date: '10/04/1992')
    Vehicle.create!(license_plate: 'jka1234', full_load: 100, car_model: 'sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)
    Vehicle.create!(license_plate: 'jks1234', full_load: 200, car_model: 'clio',   year: '2021', vehicle_brand: 'Renault', hauler: hauler2)

    login_as user
    visit user_hauler_path(hauler)
    click_on 'Gerenciar Veículos'

    expect(current_path).to eq user_hauler_vehicles_path(hauler)
    expect(page).to have_content 'Modelo: sandero'
    expect(page).not_to have_content 'Modelo: clio'
    expect(page).to have_content 'Ano: 2020'
    expect(page).not_to have_content 'Ano: 2021'
  end

  it 'e vê detalhes de um veículo' do
    hauler = Hauler.create!(brand_name: 'Transporte 323', corporate_name: 'Transporte LTDA2', registration_number: '00000000000001', address: 'qnd 02', email_domain: 'transporte2.com.br')
    user = User.create!(name: 'Júnior', email: 'jr@transporte2.com.br', password: 'treinadev08', birth_date: '10/04/1992')
    Vehicle.create!(license_plate: 'jka1234', full_load: 100, car_model: 'sandero', year: '2020', vehicle_brand: 'Renault', hauler: hauler)
    Vehicle.create!(license_plate: 'jka1235', full_load: 200, car_model: 'clio', year: '2021', vehicle_brand: 'Renault', hauler: hauler)

    login_as user
    visit user_hauler_vehicles_path(hauler)
    click_on 'sandero'


    expect(page).to have_content 'sandero'
    expect(page).to have_content 'Ano: 2020'
    expect(page).to have_content 'Carga máxima: 100'
    expect(page).to have_content 'Placa: jka1234'
    expect(page).to have_content 'Marca: Renault'
    expect(page).not_to have_content 'Modelo: clio'
  end

  it 'e não tem nenhum veículo cadastrado' do
    hauler = Hauler.create!(brand_name: 'Transporte 323', corporate_name: 'Transporte LTDA2', registration_number: '00000000000001', address: 'qnd 02', email_domain: 'transporte2.com.br')
    user = User.create!(name: 'Júnior', email: 'jr@transporte2.com.br', password: 'treinadev08', birth_date: '10/04/1992')

    login_as user
    visit user_hauler_path(hauler)
    click_on 'Gerenciar Veículos'

    expect(page).to have_content 'Nenhum veículo cadastrado'
  end

  it 'e precisa estar logado' do
    hauler = Hauler.create!(brand_name: 'Transporte 323', corporate_name: 'Transporte LTDA2', registration_number: '00000000000001', address: 'qnd 02', email_domain: 'transporte2.com.br')

    visit user_hauler_path(hauler)

    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
end