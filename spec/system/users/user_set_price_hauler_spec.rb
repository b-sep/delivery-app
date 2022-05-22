require 'rails_helper'

describe 'usuário cadastra novo preço na transportadora' do
  it 'com sucesso' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

    user = User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')

    login_as user
    visit user_hauler_prices_path(hauler)
    click_on 'Cadastrar novo preço'

    fill_in 'Mínimo metro cúbico', with: '0.001'
    fill_in 'Máximo metro cúbico', with: '0.500'
    fill_in 'Peso mínimo', with: '1'
    fill_in 'Peso máximo', with: '5'
    fill_in 'Preço por km', with: 10
    click_on 'Salvar preço'

    expect(page).to have_content 'Preço cadastrado com sucesso!'
    expect(current_path).to eq user_hauler_prices_path(hauler)
    expect(hauler.prices.last).to eq Price.last
  end

  it 'sem sucesso' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

    user = User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')

    login_as user
    visit user_hauler_prices_path(hauler)
    click_on 'Cadastrar novo preço'
    fill_in 'Mínimo metro cúbico', with: ''
    fill_in 'Máximo metro cúbico', with: ''
    fill_in 'Peso mínimo', with: ''
    click_on 'Salvar preço'

    expect(page).to have_content 'Erro ao cadastrar preço'
    expect(page).not_to have_content 'Preço cadastrado com sucesso!'
    expect(page).to have_content 'não pode ficar em branco', count: 5
  end

  it 'e precisa estar logado' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')
    
    visit user_hauler_prices_path(hauler)
    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
end