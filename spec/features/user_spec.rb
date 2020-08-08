require_relative '../rails_helper'

RSpec.describe 'user journey', type: :system do
  describe 'Navigate the webpage' do
    it 'creates a new user, logs in and updates profile info' do
      visit root_path
      click_on 'Sign up'
      fill_in 'user[name]', with: 'Calvin'
      sleep(3)
      fill_in 'user[email]', with: 'calvin@mail.om'
      sleep(3)
      click_button 'Sign up'
      sleep(3)
      expect(page).to have_content('Calvin')
      sleep(3)
      click_on 'Log out'
      expect(page).to have_content('LOG IN')
      sleep(3)
      click_on 'Log in'
      fill_in 'session[email]', with: 'calvin@mail.om'
      click_button 'Log in'
      expect(page).to have_content('Calvin')
      sleep(3)
      find('.profile-info .title a').click
      sleep(3)
      expect(page).to have_content('Edit: Calvin')
      sleep(3)
      fill_in 'user[surname]', with: 'Harris'
      sleep(3)
      fill_in 'user[bio]', with: 'Scottish DJ, record producer, singer, and songwriter'
      sleep(2)
      find('form input[type="file"]').set('./spec/test_user.jpg')
      click_button 'Save'
      expect(page).to have_content('Scottish DJ, record producer, singer, and songwriter')
      expect(page).to have_content('Harris')
    end
  end
end
