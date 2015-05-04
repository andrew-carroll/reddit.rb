module SessionsHelper
  def login_with(username: '', password: '')
    visit login_path
    within 'form#login' do
      fill_in 'Username', with: username
      fill_in 'Password', with: password
      click_button 'Sign In'
    end
  end

  def login
    password = 'hunter2'
    user = create(:user, password: password)
    login_with(username: user.username, password: password)
    return user
  end
end
