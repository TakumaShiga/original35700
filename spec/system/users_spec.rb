require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context  'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      #トップページにハンバーガーアイコンがあり、サインアップページへ遷移するボタンがあることを確認する
      find('.menubar').find('a').click
    ).to have_content('新規登録')
      # ユーザー情報を入力する
      fill_in 'お名前', with: @user.full_name
      fill_in 'ニックネーム', with: @user.nickname
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード確認', with: @user.password_confirmation
      fill_in '自己紹介文', with: @user.introduce
      fill_in 'プロフィール画像', with: @user.image
      fill_in '生年月日', with: @user.birth_day
      fill_in '性別', with: @user.gender
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit]').click
      }.to change {User.count}.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # カーソルを合わせるとログアウトボタンが表示されることを確認する
      find('.menubar').find('a').click
    ).to have_content('ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      find('.menubar').find('a').click
    ).to have_no_content('新規登録')
      find('.menubar').find('a').click
    ).to have_no_content('ログイン')
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
    visit root_path
    # トップページにサインアップページへ遷移するボタンがあることを確認する
    expect(page).to have_content('新規登録')
    # 新規登録ページへ移動する
    visit new_user_registration_path
    # ユーザー情報を入力する
    fill_in 'お名前', with: @user.full_name
    fill_in 'ニックネーム', with: @user.nickname
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    fill_in 'パスワード確認', with: @user.password_confirmation
    fill_in '自己紹介文', with: @user.introduce
    fill_in '性別', with: @user.gender
    fill_in '生年月日', with: @user.birth_day
    fill_in '', with: @user.
    # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { User.count }.by(0)
    # 新規登録ページへ戻されることを確認する
    expect(current_path).to eq user_registration_path
    end
  end


  # ログイン
  Rspec.describe 'ログイン', type: :system do
    before do
      @user = FactoryBot.create(:user)
    end
  context 'ログインができるとき'do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      find('menubar').find('a').click
    ).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      # ログインボタンを押す
      find('input[name="commit]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq (root_path)
      # ハンバーガーアイコンをクリックするとログアウトボタンが表示されることを確認する
      find('menubar').find('a').click
    ).to have_content('ログアウト')
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      find('menubar').find('a').click
    ).to have_no_content('新規登録')
      find('menubar').find('a').click
    ).to have_no_content('ログイン')
    end
  end

  context 'ログインができないとき'do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # ハンバーガアイコンをクリックするとログインページへ遷移するボタンがあることを確認する
      find('menubar').find('a').click
    ).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      # ログインボタンを押す
      find('input[name="commit]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

  # 編集
  Rspec.describe 'ユーザー編集', type: :system do
    before do
      @user = FactoryBot.create(:user)
    end
  context 'ユーザー編集できるとき'do
    it '正しい情報を入力すればユーザー編集ができてマイページに移動する' do
      # ログインする
      sign_in(@user)
      # トップページヘ移動する
      visit root_path
      # ハンバーガーアイコンをクリックするとユーザー情報編集ページへ遷移できるボタンがあることを確認する
      find('menubar').find('a').click
      ).to have_content('編集する')
      # ユーザー情報編集ページへ移動する
      visit user_path(@user)
      #ユーザー情報を入力する
      fill_in 'ニックネーム', with: @user.nickname
      fill_in 'プロフィール画像', with: @user.image
      fill_in '自己紹介文', with: @user.introduce
      # updateボタンを押す
      click_on('Update')
      #マイページへ遷移されたことを確認する
      expect(current_path).to eq(user_path(@user))

    end
  end

  context 'ユーザー編集できないとき' do
    it '誤った情報ではユーザー編集されず編集ページに戻ってくる'do
      # ログインする
      sign_in(@user)
      # トップページヘ移動する
      visit root_path
      # ユーザー詳細ページにユーザー情報編集ページへ遷移できるボタンがあることを確認する
      find('menubar').find('a').click
      ).to have_content('編集する')
      # ユーザー情報編集ページへ移動する
      visit user_path(@user)
      #ユーザー情報を入力する
      fill_in 'ニックネーム', with: ''
      fill_in 'プロフィール画像', with: ''
      fill_in '自己紹介文', with: ''
      # updateボタンを押す
      click_on('Update')
      #保存されず編集ページへ戻されたことを確認する
      expect(current_path).to eq(root_path)
    end
  end

end
