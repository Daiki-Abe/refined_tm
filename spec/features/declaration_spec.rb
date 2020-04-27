require 'rails_helper'

feature 'ログイン前', type: :feature do
  scenario 'ホームが表示されているか' do
    visit root_path
    expect(page).to have_link 'ホーム'
  end

  scenario '記録一覧が表示されているか' do
    visit root_path
    expect(page).to have_link '記録一覧'
  end

  scenario '新規登録が表示されているか' do
    visit root_path
    expect(page).to have_link '新規登録'
  end

  scenario 'ログインが表示されているか' do
    visit root_path
    expect(page).to have_link 'ログイン'
  end

  scenario 'ログアウトが表示されていないか' do
    visit root_path
    expect(page).to have_no_link 'ログアウト'
  end

  scenario 'ログインする画面に移行できるか' do
    visit root_path
    click_on 'ログイン'
    expect(current_path).to eq new_user_session_path
  end

  scenario '新規登録する画面に移行できるか' do
    visit root_path
    click_on '新規登録'
    expect(current_path).to eq new_user_registration_path
  end

  scenario '記録一覧を押下しても、ホーム画面に移行できるか' do
    visit root_path
    click_on '記録一覧'
    expect(current_path).to eq root_path
  end

  scenario 'Start!!を押下しても、ホーム画面に移行できるか' do
    visit root_path
    click_on 'Start!!'
    expect(current_path).to eq root_path
  end
end

feature 'ログイン後', type: :feature do
  background do
    create(:user)
  end

  scenario 'ログインできるか' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'beti@gamil.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'ログインする'
    expect(page).to have_content 'ログインしました。'
  end

  scenario 'ログアウトが表示されているか' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'beti@gamil.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'ログインする'
    expect(page).to have_link 'ログアウト'
  end

  scenario '新規登録が表示されていないか' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'beti@gamil.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'ログインする'
    expect(page).to have_no_link '新規登録'
  end

  scenario 'ログインが表示されていないか' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'beti@gamil.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'ログインする'
    expect(page).to have_no_link 'ログイン'
  end

  scenario 'ログアウトできるか' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'beti@gamil.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'ログインする'
    click_on 'ログアウト'
    expect(current_path).to eq root_path
  end

  scenario '記録ができるか' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'beti@gamil.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'ログインする'
    click_on 'Start!!'
    expect(current_path).to eq new_declaration_path
  end

  scenario '記録一覧を表示できるか' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'beti@gamil.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'ログインする'
    click_on '記録一覧'
    expect(current_path).to eq score_declarations_path
  end

  scenario '記録一覧から記録画面に移行できるか' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'beti@gamil.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'ログインする'
    click_on '記録一覧'
    click_on 'Start!!'
    expect(current_path).to eq new_declaration_path
  end

  scenario '記録するときにwhatカラムに入力ができているか' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'beti@gamil.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'ログインする'
    click_on 'Start!!'
    fill_in '今から何をしますか？', with: '勉強'
    fill_in '何のためにするのですか？', with: 'エンジニアになるため'
    fill_in '目標の時間を入力してください', with: '３時間'
    expect(page).to have_field '今から何をしますか？', with: '勉強'
  end

  scenario '記録するときにwhyカラムに入力ができているか' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'beti@gamil.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'ログインする'
    click_on 'Start!!'
    fill_in '今から何をしますか？', with: '勉強'
    fill_in '何のためにするのですか？', with: 'エンジニアになるため'
    fill_in '目標の時間を入力してください', with: '３時間'
    expect(page).to have_field '何のためにするのですか？', with: 'エンジニアになるため'
  end

  scenario '記録するときにtimeカラムに入力ができているか' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'beti@gamil.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'ログインする'
    click_on 'Start!!'
    fill_in '今から何をしますか？', with: '勉強'
    fill_in '何のためにするのですか？', with: 'エンジニアになるため'
    fill_in '目標の時間を入力してください', with: '３時間'
    expect(page).to have_field '目標の時間を入力してください', with: '３時間'
  end
end
