require 'rails_helper'

describe 'administrador acessa opção para cadastrar transportadora' do
  it 'cadastra com sucesso e a transportadora nasce inativa' do
    admin  = Admin.create!(email: 'jr@deliveryapp.com', password: '123treinadev')

    visit root_path
    within ('nav') do
      click_on 'Admin?'
    end
    within 'form' do
      fill_in 'E-mail', with: 'jr@deliveryapp.com'
      fill_in 'Senha', with: '123treinadev'
      click_on 'ENTRAR'
    end

    click_on 'Transportadoras'
    click_on 'Cadastrar transportadora'
    fill_in 'Razão Social', with: 'Bom transporte LTDA'
    fill_in 'Nome Fantasia', with: 'Bom transporte'
    fill_in 'Endereço', with: 'rua 298, santo amaro'
    fill_in 'CNPJ', with: '00000000000001'
    fill_in 'Domínio de email', with: 'bomtransporte.com.br'
    click_on 'Cadastrar Transportadora'
    
    expect(current_path).to eq '/admin/haulers/1'
    expect(page).to have_content 'Transportadora cadastrada com sucesso'
    expect(page).to have_content 'Status: Inativa'
  end

  it 'e cadastra sem sucesso' do
    admin  = Admin.create!(email: 'jr@deliveryapp.com', password: '123treinadev')

    visit root_path
    within ('nav') do
      click_on 'Admin?'
    end
    within 'form' do
      fill_in 'E-mail', with: 'jr@deliveryapp.com'
      fill_in 'Senha', with: '123treinadev'
      click_on 'ENTRAR'
    end
    click_on 'Transportadoras'
    click_on 'Cadastrar transportadora'
    fill_in 'Razão Social', with: ''
    fill_in 'Nome Fantasia', with: ''
    click_on 'Cadastrar Transportadora'

    expect(page).to have_content 'Erro ao cadastrar transportadora'
    expect(page).to have_content 'Razão Social não pode ficar em branco'
    expect(page).to have_content 'Nome Fantasia não pode ficar em branco'
  end

  it 'e não está logado' do
    visit new_admin_hauler_path
    
    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
end