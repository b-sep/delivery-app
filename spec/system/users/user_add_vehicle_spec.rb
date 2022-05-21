require 'rails_helper'

describe 'usuário cadastra veículo a transportadora' do
  it 'com sucesso' do
    hauler = Hauler.create!(brand_name: 'Transporte 323', corporate_name: 'Transporte LTDA2', registration_number: '00000000000001', address: 'qnd 02', email_domain: 'transporte2.com.br')
    user = User.create!(name: 'Júnior', email: 'jr@transporte2.com.br', password: 'treinadev08', birth_date: '10/04/1992')

    login_as user
    visit user_hauler_vehicles_path(hauler)
    click_on 'Cadastrar veículo'
    fill_in 'Placa', with: 'AAA-1234'
    fill_in 'Carga máxima', with: 100
    fill_in 'Modelo', with: 'sandero'
    fill_in 'Ano', with: '2020'
    fill_in 'Marca', with: 'Renault'
    click_on 'Salvar Veículo'

    expect(page).to have_content 'Veículo cadastrado com sucesso!'
    expect(hauler.vehicles.last).to eq Vehicle.last
  end
end