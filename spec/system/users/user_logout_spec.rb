require 'rails_helper'

describe 'usuário faz login' do
  it 'e clica em sair' do
    Hauler.create!(brand_name: 'Transporte 323', corporate_name: 'Transporte LTDA2', registration_number: '00000000000001', address: 'qnd 02', email_domain: 'transporte2.com.br')
    user = User.create!(name: 'Júnior', email: 'jr@transporte2.com.br', password: 'treinadev08', birth_date: '10/04/1992')

    login_as user
    visit root_path
    within 'nav' do
      click_on 'Sair'
    end

    expect(page).to have_content 'Logout efetuado com sucesso.'
    expect(page).to_not have_link 'Sair'
    expect(page).to have_link 'Entrar'
  end
end