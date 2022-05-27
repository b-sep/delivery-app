require 'rails_helper'

describe 'Admin ve ordens de serviço' do
  it 'com sucesso' do
    admin = Admin.create!(email: 'jr@deliveryapp.com', password: '123456')
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', 
                            address: 'qnd 03', email_domain: 'transporte.com.br', status: 'active')
    hauler2 = Hauler.create!(brand_name: 'Transporte 323', corporate_name: 'Transporte LTDA2', registration_number: '00000000000010', 
                            address: 'qnd 04', email_domain: 'transporte2.com.br', status: 'active')                   
    o1 = Order.create!(heigth: 10, depth: 10, width: 20, distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

    o2 = Order.create!(heigth: 20, depth: 30, width: 20, distance: 300, weight: 11, price: 22, days: 4, user: 'Júnior', address: 'qs 19', hauler: hauler2)
        
    login_as admin, :scope => :admin
    visit admin_orders_path

    expect(page).to have_content 'Transportadora Transporte 322'
    expect(page).to have_content 'Transportadora Transporte 323'
    expect(page).to have_content "Ordem: #{o1.code}"
    expect(page).to have_content "Ordem: #{o2.code}"
  end

  it 'e não existe ordem de serviço cadastrada' do
    admin = Admin.create!(email: 'jr@deliveryapp.com', password: '123456')

    login_as admin, :scope => :admin
    visit admin_orders_path

    expect(page).to have_content 'Nenhuma ordem de serviço cadastrada'
  end

  it 'e precisa estar logado para visualizar' do
    visit admin_orders_path

    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
end