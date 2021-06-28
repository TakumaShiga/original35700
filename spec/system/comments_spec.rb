require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @tweet = FactoryBot.create(:tweet)
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーはツイート詳細ページでコメント投稿できる' do
    # ログインする
    expect(
      find('.bar', :visible => false).find('a').click
  ).to have_content('ログイン')
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    find('input[name="commit]').click
    expect(current_path).to eq (root_path)
    # ツイート詳細ページに遷移する
    # フォームに情報を入力する
    fill_in 'comment_text', with: @comment
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect{
      find('name["commit]').click
    }.to change {Comment.count}.by)(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq(tweet_path(@tweet))
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @comment
  end
end

Rspec.describe 'コメント削除', type: :system do
  before do
    @tweet = FactoryBot.create(:tweet)
    @comment = Faker::Lorem.sentence
  end
  context 'コメント削除できるとき'
    it 'ログインしたユーザーはツイート詳細ページで自分が投稿したコメントを削除できる' do
    #ログインする

    # ツイート詳細ページに遷移する
    # コメントを削除すると、Commentモデルのカウントが1下がることを確認する
    # コメントした本人であれば、コメント削除ボタンがあることを確認できる
      
    end
  end
  context 'コメント削除できないとき'
    it 'ログインしたユーザーはツイート詳細ページで自分が投稿したコメントでなければ削除できない' do
    #ログインする

    # ツイート詳細ページに遷移する  
    # コメントした本人でなければ、コメント削除ボタンは表示されない
    end
  end
end
  

