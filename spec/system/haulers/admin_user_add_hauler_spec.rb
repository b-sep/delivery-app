require 'rails_helper'

describe 'usuário administrador acessa opção para cadastrar transportadora' do
  it 'e cadastra com sucesso' do

    visit root_path
    # within ('nav') do
    #   click_on 'page de admin'
    # end
    click_on 'Transportadoras'
    click_on 'Cadastrar Transportadora'
    fill_in 'Razão Social', with: 'Bom transporte LTDA'
    fill_in 'Nome Fantasia', with: 'Bom transporte'
    fill_in 'Endereço', with: 'rua 298, santo amaro'
    fill_in 'CNPJ', with: '00000000000001'
    fill_in 'Domínio de email', with: 'bomtransporte.com.br'
    click_on 'Cadastrar Transportadora'
    
    expect(page).to have_content 'Transportadora cadastrada com sucesso'
  end

  it 'e cadastra sem sucesso' do
    visit root_path
    click_on 'Transportadoras'
    click_on 'Cadastrar Transportadora'
    fill_in 'Razão Social', with: ''
    fill_in 'Nome Fantasia', with: ''
    click_on 'Cadastrar Transportadora'

    expect(page).to have_content 'Erro ao cadastrar transportadora'
    expect(page).to have_content 'Razão Social não pode ficar em branco'
    expect(page).to have_content 'Nome Fantasia não pode ficar em branco'
  end
end