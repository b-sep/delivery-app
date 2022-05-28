require 'rails_helper'

describe 'Usuário visualiza ordens de serviço' do
  it 'com sucesso' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

    hauler2 = Hauler.create!(brand_name: 'Transporte 312', corporate_name: 'Transporte LTDA2', registration_number: '00000100000000', address: 'qnd 04', email_domain: 'transporte2.com.br', status: "active")

    user = User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')

    o1 = Order.create!(heigth: 10, depth: 10, width: 20, distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

    o2 = Order.create!(heigth: 20, depth: 30, width: 20, distance: 300, weight: 11, price: 22, days: 4, user: 'Júnior', address: 'qs 19', hauler: hauler2, status: 'accepted')

    login_as user, :scope => :user
    visit user_hauler_path(hauler)

    expect(page).to have_content 'Ordens de Serviço'
    expect(page).to have_content "Ordem: #{o1.code} | status: Pendente"
    expect(page).not_to have_content "Ordem: #{o2.code} | status: Aceita"
  end

  it 'e não vê ordem de serviço de outra transportadora' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

    hauler2 = Hauler.create!(brand_name: 'Transporte 312', corporate_name: 'Transporte LTDA2', registration_number: '00000100000000', address: 'qnd 04', email_domain: 'transporte2.com.br')
    
    user = User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')

    o1 = Order.create!(heigth: 10, depth: 10, width: 20, distance: 200, weight: 14, price: 20, days: 2, user: 'Júnior', address: 'qs 19', hauler: hauler)

    o2 = Order.create!(heigth: 20, depth: 30, width: 20, distance: 300, weight: 11, price: 22, days: 4, user: 'Júnior', address: 'qs 19', hauler: hauler2)

    login_as user, :scope => :user
    visit user_hauler_path(hauler)

    expect(page).to have_content 'Ordens de Serviço'
    expect(page).to have_content "Ordem: #{o1.code} | status: Pendente"
    expect(page).not_to have_content "#{o2.code}"
  end

  it 'e não existem ordens de serviço' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')

    user = User.create!(email: 'jr2@transporte.com.br', password: '123456', name: 'Jr', birth_date: '10/04/1992')

    login_as user, :scope => :user
    visit user_hauler_path(hauler)

    expect(page).to have_content 'Nenhuma Ordem de serviço aberta =('
  end

  it 'e precisa estar logado para visualizar' do
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', email_domain: 'transporte.com.br')
    visit user_hauler_path(hauler)

    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
end