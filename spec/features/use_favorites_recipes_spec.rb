require 'rails_helper'

describe 'Usuário autenticado favorita' do
  it 'com sucesso' do
    recipe = FactoryBot.create(:recipe, title: 'Hambúrguer')
    user = FactoryBot.create(:user)

    login_as user
    visit root_path
    click_on 'Hambúrguer'
    click_on'Favoritar'

    expect(page).to have_content 'Receita favoritada!'
  end

  it 'e vê lista de favoritos' do
    recipe = FactoryBot.create(:recipe, title: 'Hambúrguer')
    recipe = FactoryBot.create(:recipe, title: 'Cachorro Quente')
    user = FactoryBot.create(:user)

    login_as user
    visit root_path
    click_on 'Hambúrguer'
    click_on 'Favoritar'
    click_on 'Favoritos'

    expect(page).to have_content 'Hambúrguer'
    expect(page).not_to have_content 'Cachorro Quente'
  end
end