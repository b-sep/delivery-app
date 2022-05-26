require 'rails_helper'

describe 'Admin visualiza todas as transportadoras cadastradas' do
  it 'com sucesso' do
    Admin.create!(email: 'jr@deliveryapp.com', password: '123456')
    
    Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', 
                   email_domain: 'transporte.com.br', status: 'active')
    Hauler.create!(brand_name: 'Transporte 3111', corporate_name: 'Transporte LTDA3', registration_number: '00000200000000', address: 'qnd 05', 
                   email_domain: 'transporte3.com.br', status: 'active')
    Hauler.create!(brand_name: 'Transporte 311', corporate_name: 'Transporte LTDA4', registration_number: '00000900000000', address: 'qnd 01', 
                    email_domain: 'transporte4.com.br')

    visit root_path
    click_on 'Admin?'
    fill_in 'E-mail', with: 'jr@deliveryapp.com'
    fill_in 'Senha', with: '123456'
    click_on 'ENTRAR'
    click_on 'Transportadoras'
    

    expect(page).to have_content 'Transporte 322'
    expect(page).to have_content 'Transporte 3111'
    expect(page).to have_content 'Transporte 311'
    expect(page).to have_content '00000000000000'
    expect(page).to have_content '00000200000000'
    expect(page).to have_content '00000900000000'
    expect(current_path).to eq admin_haulers_path
    expect(page).to have_link 'Cadastrar transportadora'
  end

  it 'e não existe transportadora cadastradas' do
    admin = Admin.create!(email: 'jr@deliveryapp.com', password: '123456')

    login_as(admin, :scope => :admin)
    visit admin_haulers_path

    expect(page).to have_content 'Nenhuma transportadora cadastrada.'
    expect(page).to have_link 'Cadastrar transportadora'
  end

  it 'e precisa estar logado' do
    visit admin_haulers_path
    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
end