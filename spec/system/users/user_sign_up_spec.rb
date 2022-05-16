require 'rails_helper'

describe 'usuário se cadastra na aplicação' do
  it 'com sucesso' do

    visit root_path
    within 'nav' do
      click_on 'Entrar'
    end
    click_on 'Não tem conta? CADASTRE-SE.'
    fill_in 'Nome', with: 'Roberto'
    fill_in 'E-mail', with: 'jr2@treinadev.com.br'
    fill_in 'Senha', with: 'treinadev08'
    fill_in 'Confirme sua senha', with: 'treinadev08'
    fill_in 'Data de nascimento', with: '10/04/1992'
    click_on 'CADASTRAR'

    expect(page).to have_content 'Olá, Roberto'
    within 'nav' do
      expect(page).to have_link 'Sair'
    end
    expect(page).to have_content 'Cadastro criado com sucesso'
    user = User.last
    expect(user.name).to eq 'Roberto'
  end
end