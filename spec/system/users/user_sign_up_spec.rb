require 'rails_helper'

describe 'usuário se cadastra na aplicação' do
  it 'e é vinculado a uma transportadora automaticamente' do

    Hauler.create!(brand_name: 'Transporte 323', corporate_name: 'Transporte LTDA2', registration_number: '00000000000001', address: 'qnd 02', email_domain: 'transporte2.com.br')
    Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

    visit root_path
    within 'nav' do
      click_on 'Entrar'
    end
    click_on 'Não tem conta? CADASTRE-SE.'
    fill_in 'Nome', with: 'Roberto'
    fill_in 'E-mail', with: 'jr2@transporte.com.br'
    fill_in 'Senha', with: 'treinadev08'
    fill_in 'Confirme sua senha', with: 'treinadev08'
    fill_in 'Data de nascimento', with: '10/04/1992'
    click_on 'CADASTRAR'

    expect(page).to have_content 'Olá, Roberto'
    within 'nav' do
      expect(page).to have_link 'Sair'
    end
    expect(page).to have_content 'Cadastro criado com sucesso'
    expect(page).to have_content 'Transportadora Transporte 322'
    expect(User.last.hauler).to eq Hauler.last
  end
end