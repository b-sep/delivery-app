require 'rails_helper'

describe 'usuário faz login' do
  it 'com sucesso' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

    User.create!(name: 'Júnior', email: 'jr@transporte.com.br', password: 'treinadev08', birth_date: '10/04/1992', hauler: hauler)

    visit root_path
    within 'nav' do
       click_on 'Entrar'
    end
    within 'form' do
      fill_in 'E-mail', with: 'jr@transporte.com.br'
      fill_in 'Senha', with: 'treinadev08'
      click_on 'ENTRAR'
    end

    expect(page).to have_content 'Login efetuado com sucesso'
    expect(page).to have_link 'Sair'
    expect(page).to_not have_link 'Entrar'
    within 'nav' do
      expect(page).to have_content 'Olá, Júnior'
    end
  end
end