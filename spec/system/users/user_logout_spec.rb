require 'rails_helper'

describe 'usuário faz login' do
  it 'e clica em sair' do
    User.create!(name: 'Júnior', email: 'jr@treinadev.com.br', password: 'treinadev08', birth_date: '10/04/1992')

    visit root_path
    within 'nav' do
      click_on 'Entrar'
    end
    within 'form' do
      fill_in 'E-mail', with: 'jr@treinadev.com.br'
      fill_in 'Senha', with: 'treinadev08'
      click_on 'ENTRAR'
    end
    within 'nav' do
      click_on 'Sair'
    end

    expect(page).to have_content 'Logout efetuado com sucesso.'
    expect(page).to_not have_link 'Sair'
    expect(page).to have_link 'Entrar'
  end
end