require_relative '../rails_helper'

RSpec.describe 'articles workflow', type: :system do
  describe 'add a new article' do
    before do
      Category.create(name: 'Recipes', priority: 1)
      User.create(email: 'calvin@mail.com', name: 'Calvin')
    end

    it 'logs in and creates an article' do
      visit root_path
      click_on 'Log in'
      fill_in 'session[email]', with: 'calvin@mail.com'
      click_button 'Log in'
      expect(page).to have_content('Calvin')
      sleep(3)
      click_link('Add article')

      expect(page).to have_content('New article')

      fill_in('article[title]', with: 'Test recipe')
      sleep(2)
      fill_in('article[preview_text]', with: 'test preview text')
      sleep(2)
      find('form trix-editor').set('test content')
      sleep(2)
      find('form input[type="file"]').set('./spec/test_pic.jpg')
      sleep(2)
      click_button('Save')
      sleep(2)

      expect(page).to have_content('Test recipe')
    end
  end
end
