require 'rails_helper'

describe 'Admin altera status da transportadora' do
  it 'com sucesso' do
    admin = Admin.create!(email: 'jr@deliveryapp.com', password: '123456')
    hauler = Hauler.create!(brand_name: 'Transporte 322', corporate_name: 'Transporte LTDA', registration_number: '00000000000000', address: 'qnd 03', 
                   email_domain: 'transporte.com.br', status: 'active')

    login_as(admin, :scope => :admin)
    visit admin_hauler_path(hauler)
    select 'Inativa', from: 'hauler_status'
    click_on 'Atualizar'


    expect(page).to have_content 'Status: Inativa'
  end
end