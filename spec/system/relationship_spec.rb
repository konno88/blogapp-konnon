require 'rails_helper'

RSpec.describe 'Relationship', type: :system do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user, email: 'otheruser@example.com') }

  context 'フォローしている場合' do
    before do
      FactoryBot.create(:relationship, user: user, follow: other_user)
    end
  end

  it 'フォロー一覧のCSSが存在する(フォローされている)' do
    visit followings_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_button  'Log in'
    expect(page).to have_css('.followings')
  end
end