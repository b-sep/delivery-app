require 'rails_helper'

describe 'usuário cadastra veículo a transportadora' do
  it 'com sucesso' do
    hauler = Hauler.create!(brand_name: 'Transporte 323', corporate_name: 'Transporte LTDA2', registration_number: '00000000000001', address: 'qnd 02', email_domain: 'transporte2.com.br')
    user = User.create!(name: 'Júnior', email: 'jr@transporte2.com.br', password: 'treinadev08', birth_date: '10/04/1992')

    login_as user
    visit user_hauler_vehicles_path(hauler)
    click_on 'Cadastrar veículo'
    fill_in 'Placa', with: 'AAA1234'
    fill_in 'Carga máxima', with: 100
    fill_in 'Modelo', with: 'sandero'
    fill_in 'Ano', with: '2020'
    fill_in 'Marca', with: 'Renault'
    click_on 'Salvar Veículo'

    expect(page).to have_content 'Veículo cadastrado com sucesso!'
    expect(current_path).to eq '/user/haulers/1/vehicles/1'
    expect(hauler.vehicles.last).to eq Vehicle.last
  end

  it 'sem sucesso' do
    hauler = Hauler.create!(brand_name: 'Transporte 323', corporate_name: 'Transporte LTDA2', registration_number: '00000000000001', address: 'qnd 02', email_domain: 'transporte2.com.br')
    user = User.create!(name: 'Júnior', email: 'jr@transporte2.com.br', password: 'treinadev08', birth_date: '10/04/1992')

    login_as user
    visit user_hauler_vehicles_path(hauler)
    click_on 'Cadastrar veículo'
    fill_in 'Placa', with: ''
    fill_in 'Carga máxima', with: ''
    fill_in 'Modelo', with: ''
    click_on 'Salvar Veículo'

    expect(page).not_to have_content 'Veículo cadastrado com sucesso!'
    expect(page).to have_content 'Erro ao salvar veículo'
    expect(page).to have_content 'não pode ficar em branco', count: 5
  end

  it 'e precisa estar logado' do
    hauler = Hauler.create!(brand_name: 'Transporte 323', corporate_name: 'Transporte LTDA2', registration_number: '00000000000001', address: 'qnd 02', email_domain: 'transporte2.com.br')

    visit user_hauler_vehicles_path(hauler)
    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
end