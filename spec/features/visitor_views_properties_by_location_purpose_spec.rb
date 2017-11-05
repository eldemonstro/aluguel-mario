require 'rails_helper'

feature 'Visitor views properties by location purposes' do
  scenario 'successfully' do
    location_purpose = create(:location_purpose)
    property = create(:property)
    property2 = create(:property, title: 'Super casa')
    property.location_purposes << location_purpose
    property2.location_purposes << location_purpose

    visit root_path
    click_on location_purpose.title

    expect(page).to have_content(property.title)
    expect(page).to have_content(property2.title)
  end

  scenario 'and don\'t have any property' do
    location_purpose = create(:location_purpose)

    visit root_path
    click_on location_purpose.title

    expect(page).to have_content('Nenhum imóvel nessa categoria')
  end
end
