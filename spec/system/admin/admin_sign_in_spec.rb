require 'rails_helper'

describe 'admin faz login' do
  it 'com sucesso' do
    admin = Admin.create!(email: 'jr@deliveryapp.com', password: '123treinadev')

    visit root_path
    click_on 'Admin?'
    fill_in 'E-mail', with: 'jr@deliveryapp.com'
    fill_in 'Senha',with: '123treinadev'
    click_on 'ENTRAR'

    expect(page).to have_content 'Login efetuado com sucesso.'
    expect(page).to have_content 'Cadastrar transportadora'
  end
end