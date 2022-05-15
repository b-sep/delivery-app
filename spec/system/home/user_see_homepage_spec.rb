require 'rails_helper'

describe 'visitante acessa página inicial da aplicação' do
  it 'e vê nome da aplicação' do
    visit root_path

    expect(page).to have_content 'Delivery </> app'
  end
end