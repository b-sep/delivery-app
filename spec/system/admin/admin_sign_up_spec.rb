require 'rails_helper'

describe 'usuário se cadastrar como admin' do
  it 'com sucesso' do
    visit root_path
    click_on 'Admin?'
    click_on 'Cadastre-se como admin'
    fill_in 'E-mail', with: 'jr@deliveryapp.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: '123456'
    click_on 'CADASTRAR'

    expect(page).to have_content 'Cadastrar transportadora'
    expect(page).to have_content 'Cadastro criado com sucesso'
  end

  it 'sem sucesso' do
    visit root_path
    click_on 'Admin?'
    click_on 'Cadastre-se como admin'
    fill_in 'E-mail', with: 'jr@teste.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: '123456'
    click_on 'CADASTRAR'

    expect(page).to have_content 'Admin inválido'
  end
end