require 'rails_helper'

RSpec.describe "ツイート投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @tweet_text = Faker::Lorem.sentence
  end
  context 'ツイート投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる'  do
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(
        find('.bar', :visible => false).find('a').click
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
      # 新規投稿ページへのボタンがあることを確認する
      expect(page).to have_content('Tweetする')
      # 投稿ページに移動する
      visit new_tweet_path
      # フォームに情報を入力する
      fill_in 'tweet_text', with: @tweet_text
      # 送信するとTweetモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {Tweet.count}.by(1)
      # トップページに遷移する
      expect(current_path).to eq(root_path)
      # 「投稿が完了しました」の文字があることを確認する
      expect(page).to have_content('投稿が完了しました')
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（画像）
      expect(page).to have_selector
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（テキスト）
      expect(page).to have_content(@tweet_text)
    end
  end
  
  context 'ツイート投稿ができないとき'do
  it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのボタンがあることを確認する
      expect(page).to have_content('Tweetする')
      # 新規投稿ページへのボタンを押下する
      click_on('Tweetする')
      #ログインページへ遷移される
      expect(current_path).to eq(new_user_session_path)
      
    end
  end 
end

Rspec.describe 'ツイート編集', type: :system do
  before do
    @tweet1 = FactoryBot.create(:tweet)
    @tweet2 = FactoryBot.create(:tweet)
  end
  context 'ツイート編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿したツイートの編集ができる' do
      # トップページにログインページへ遷移し、ツイート１を投稿したユーザーでログインする
      expect(
        find('.bar', :visible => false).find('a').click
    ).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit]').click
      expect(current_path).to eq (root_path)
      # トップページのツイート1に「編集」へのリンクがあることを確認する
      expect(
        find('.fa-commnet-dots').click
      ).to have_link '', href: edit_tweet_path(@tweet)
      # 編集ページへ遷移する
      visit edit_user_path(@user)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      # 投稿内容を編集する
      fill_in '' with: @tweet1.text
      # 編集してもTweetモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {Tweet.count}.by(0)
      # 編集完了しトップページに遷移したことを確認する
      expect(current_path).to eq(root_path)
      # 「更新が完了しました」の文字があることを確認する
      expect(page).to have_content('投稿を編集しました')
      # トップページには先ほど変更した内容のツイートが存在することを確認する（画像）
      expect(page).to have_content()
      # トップページには先ほど変更した内容のツイートが存在することを確認する（テキスト）
      expect(page).to have_content("#{@tweet1.text}+編集したテキスト")
    end

  end
  context 'ツイート編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したツイートの編集画面には遷移できない' do
       # トップページにログインページへ遷移し、ツイート１を投稿したユーザーでログインする
       expect(
        find('.bar', :visible => false).find('a').click
    ).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit]').click
      expect(current_path).to eq (root_path)
      # ツイート2に「編集」へのリンクがないことを確認する
      expect(page)
    end
    it 'ログインしていないとツイートの編集画面には遷移できない' do 
      # トップページにいる
      visit root_path
      # ツイート1に「編集」へのリンクがないことを確認する
      # ツイート2に「編集」へのリンクがないことを確認する
    end
  end
end

RSpec.describe 'ツイート削除', type: :system do
  before do
    @tweet1 = FactoryBot.create(:tweet)
    @tweet2 = FactoryBot.create(:tweet)
  end
  context 'ツイート削除ができるとき' do
    it 'ログインしたユーザーは自らが投稿したツイートの削除ができる' do
      # ツイート1を投稿したユーザーでログインする
      expect(
        find('.bar', :visible => false).find('a').click
    ).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit]').click
      expect(current_path).to eq (root_path)
      # ツイート1に詳細ページへのリンクがあることを確認する
      #詳細ページに削除ボタンはあることを確認する
      # 投稿を削除するとレコードの数が1減ることを確認する
      expect{
        
      }.to {Tweet.count}.by(-1)
      # 「削除が完了しました」の文字があることを確認する
      expect(page).to have_content('')
      # トップページに遷移する
      expect(current_path).to eq(root_path)
      # トップページにはツイート1の内容が存在しないことを確認する（画像）
      # トップページにはツイート1の内容が存在しないことを確認する（テキスト）
    end
  end
  context 'ツイート削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したツイートの削除ができない' do
      # ツイート1を投稿したユーザーでログインする
      expect(
        find('.bar', :visible => false).find('a').click
    ).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit]').click
      expect(current_path).to eq (root_path)
      # ツイート2に「削除」へのリンクがないことを確認する
    end
    it 'ログインしていないとツイートの削除ボタンがない' do
      # トップページに移動する
      visit root_path
      # ツイート1に「削除」へのリンクがないことを確認する
      # ツイート2に「削除」へのリンクがないことを確認する
    end
  end
end