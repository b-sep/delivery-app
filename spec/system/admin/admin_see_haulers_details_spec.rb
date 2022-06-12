require 'rails_helper'

describe 'Admin visualiza detalhes de uma transportadora' do
  it 'ativa com sucesso' do
    admin = Admin.create!(email: 'jr@deliveryapp.com', password: '123456')
    Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', 
                   email_domain: 'transporte.com.br', status: 'active')

    login_as(admin, :scope => :admin)
    visit admin_haulers_path
    click_on 'Transporte 322'

    expect(page).to have_content 'Transporte 322'
    expect(page).to have_content 'Razão social: Transporte LTDA'
    expect(page).to have_content '00000000000000'
    expect(page).to have_content 'qnd 03'
    expect(page).to have_content 'E-mail: transporte.com.br'
    expect(page).to have_content 'Status: Ativa'
    expect(page).to have_link 'Transportadoras'
  end

  it 'inativa com sucesso' do
    admin = Admin.create!(email: 'jr@deliveryapp.com', password: '123456')
    Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', 
                   email_domain: 'transporte.com.br')

    login_as(admin, :scope => :admin)
    visit admin_haulers_path
    click_on 'Transporte 322'

    expect(page).to have_content 'Transporte 322'
    expect(page).to have_content 'Razão social: Transporte LTDA'
    expect(page).to have_content '00000000000000'
    expect(page).to have_content 'qnd 03'
    expect(page).to have_content 'E-mail: transporte.com.br'
    expect(page).to have_content 'Status: Inativa'
  end

  it 'e precisa estar logado para ver detalhes' do
    h = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', 
                       email_domain: 'transporte.com.br')
    visit admin_hauler_path(h)

    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
end