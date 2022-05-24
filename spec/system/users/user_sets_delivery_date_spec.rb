require 'rails_helper'

describe 'usuário define data de entrega da transportadora' do
  it 'com sucesso' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')
    user = User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')

    login_as user
    visit user_hauler_delivery_dates_path(hauler)
    click_on 'Cadastrar prazo'
    fill_in 'Primeira distância', with: 0
    fill_in 'Segunda distância', with: 100
    fill_in 'Dias', with: 1
    click_on 'Salvar prazo'

    expect(page).to have_content 'Prazos'
    expect(page).to have_content 'Entre 0 e 100kms, 1 dia'
    expect(current_path).to eq user_hauler_delivery_dates_path(hauler)
    expect(page).to have_content 'Prazo cadastrado com sucesso!'
    expect(DeliveryDate.last).to eq hauler.delivery_dates.last
  end

  it 'sem preencher todos os campos' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')
    user = User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')

    login_as user
    visit user_hauler_delivery_dates_path(hauler)
    click_on 'Cadastrar prazo'

    fill_in 'Primeira distância', with: ''
    fill_in 'Dias', with: ''
    click_on 'Salvar prazo'

    expect(page).to have_content 'Erro ao salvar prazo'
  end

  it 'e precisa estar logado' do 
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')
    visit new_user_hauler_delivery_date_path(hauler)

    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
end