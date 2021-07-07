# README

## アプリケーション名
<h3>RUN Tweet</h3><br>

## 概要
いつも孤独に走るランナーが交流できる市民ランナー専用コミュニティサイト
<br>

## 本番環境
https://www.runtweet-app.xyz<br>
ユーザー名: admin<br>
パスワード: 4204<br>

<br>

## 制作背景(意図)
ランナー人口はこの20年で約400万人増加し、国内でランニングを人は1000万人近くといわれている。<br>
①新型コロナウイルスの状況で、ウォーキングやランニングに取り組む人が20%近く増加<br>
②年代別では20代の女性、30代の男性で増加率が最も高い<br>
③20〜30代男女の国内SNSの利用率がもっと多く、ランナー間では写真投稿に特化したInstagramで特に利用者が多い<br>
以上の理由が、本アプリケーションを制作するに至った背景である。<br>
<br>

## 機能一覧

ユーザー登録、ログイン機能(devise)<br>
SNSアカウント登録、ログイン機能<br>
ユーザ編集機能<br>
投稿機能<br>
投稿編集・削除機能<br>
コメント投稿機能<br>
コメント削除<br>
質問投稿機能<br>
質問編集・削除機能<br>
質問回答・削除機能<br>
イベント募集機能<br>
イベント編集・削除機能<br>
イベント申し込み機能<br>
複数枚画像投稿機能<br>
画像プレビュー機能<br>
画像スライドショー機能(Slick)<br>
いいね機能(Ajax)<br<>
いいね数表示機能<br>
いいね一覧機能<br>
ユーザーフォロー機能<br>
フォロー一覧機能<br>
フォロワー一覧機能<br>
ActiveHash機能<br>
Formオブジェクト機能<br>
PAYJPクレジットカード決済機能<br>
AWS EC2による自動デプロイ
<br>

## DEMO

## トップページ（投稿一覧画面）
[![Image from Gyazo](https://i.gyazo.com/6cef4b408c16d0593ad93de8b0bb5363.gif)](https://gyazo.com/6cef4b408c16d0593ad93de8b0bb5363)

・トップページでは、全ユーザーの投稿が降順で閲覧できる<br>
・各々の投稿にいいねすることができ、一度したいいねを解除することも可能<br>
・複数画像投稿はスライドショー形式で閲覧できる<br>
<br>

## ユーザー新規登録画面
[![Image from Gyazo](https://i.gyazo.com/55d05471f6bf004f69268b2dea4f1cd8.gif)](https://gyazo.com/55d05471f6bf004f69268b2dea4f1cd8)


・ユーザーが情報を入力するケース、FacebookもしくはGoogleのアカウントで新規登録する場合、メールアドレス、名前の情報がすでに入っている状態にする<br>

・（必須項目）名前、ニックネーム、メールアドレス、パスワード、パスワード確認、性別、生年月日、自己紹介文の項目を記入しCreate Accountをクリックすると新規登録ができる<br>
<br>

## ユーザーログイン画面
[![Image from Gyazo](https://i.gyazo.com/1fd672aaa773e94d4d74577766ee6b5a.gif)](https://gyazo.com/1fd672aaa773e94d4d74577766ee6b5a)

・ユーザーが情報を入力するケース、FacebookもしくはGoogleのアカウントでログインができる<br>
・上記動画は、Googleアカウントでログイン<br>
<br>
## 新規投稿画面
[![Image from Gyazo](https://i.gyazo.com/bcb50c4df3faf6f99164340f5aeb180e.gif)](https://gyazo.com/bcb50c4df3faf6f99164340f5aeb180e)


・テキスト欄に1日の出来事など自由に書き込む(必須項目)<br>
・画像も投稿することができる(任意)<br>
・1枚目画像選択後、新たにファイル選択ボタンが表示されるので、別の画像を投稿する<br>
・ファイル選択から、投稿したい画像を選択すると投稿画面下部に実際に投稿されるサイズの大きさで画像を確認できる<br>
<br>

## 投稿詳細画面
[![Image from Gyazo](https://i.gyazo.com/3c186e44d860b9e97dcacb7d3f7d32de.gif)](https://gyazo.com/3c186e44d860b9e97dcacb7d3f7d32de)
<br>
[![Image from Gyazo](https://i.gyazo.com/fdd2581e2004dea34a32789e314e4a08.gif)](https://gyazo.com/fdd2581e2004dea34a32789e314e4a08)


・投稿詳細ページから、コメント枠にコメントを投稿する<br>
・いいね数が表示され、数字をクリックするといいねしたユーザー一覧ページへアクセスする<br>
<br>

## ユーザー詳細画面（マイページ）
[![Image from Gyazo](https://i.gyazo.com/ed1d5d0c952fb40796b1e15cbae8c550.gif)](https://gyazo.com/ed1d5d0c952fb40796b1e15cbae8c550)
<br>
[![Image from Gyazo](https://i.gyazo.com/6ca371e4aea93382a3257a06478dcfd9.gif)](https://gyazo.com/6ca371e4aea93382a3257a06478dcfd9)

・他のユーザー詳細画面に「フォローする」表示があるのでクリックするとフォローできる<br>
・フォローをすると、マイページの「Following」でフォローしたユーザー一覧を確認できる<br>
・フォローをすると、マイページのFollowingのカウント数が1増える<br>
・他ユーザーの詳細ページで「フォローをやめる」をクリックすると、フォローが解除<br>
・フォローをしているユーザーでなければ、「フォローをやめる」は表示されない
・フォローを解除すると、マイページのFollowingのカウント数が1減る<br>
<br>

## イベント新規投稿画面
[![Image from Gyazo](https://i.gyazo.com/2153f2b21174b582aa6a2dff9c64c551.gif)](https://gyazo.com/2153f2b21174b582aa6a2dff9c64c551)


・イベント名、開催日時、カテゴリー、開催地域、開催場所、集合場所、イベントの特徴、申込み期限日、画像、エントリー費をで入力し、「募集内容を投稿する」をクリックすると、募集が完了しイベント詳細ページへ遷移する<br>

・ユーザーがイベント新規投稿画面のエントリー料金に金額を入力すると、下の項目にある「エントリー手数料」とエントリー料金からエントリー手数料を引いた、「利益」の2つが自動で計算され表示される<br>
<br>

## イベントエントリー画面
[![Image from Gyazo](https://i.gyazo.com/3550a96658f23a768af7842fa95d2d9f.gif)](https://gyazo.com/3550a96658f23a768af7842fa95d2d9f)
<br>
[![Image from Gyazo](https://i.gyazo.com/691aa2f99c92da6d9ae79556fd834ac6.gif)](https://gyazo.com/691aa2f99c92da6d9ae79556fd834ac6)
<br>
[![Image from Gyazo](https://i.gyazo.com/157625f76c2aadee141f529cdaca68c6.gif)](https://gyazo.com/157625f76c2aadee141f529cdaca68c6)

・クレジットカード情報（カード番号、有効期限、セキュリティコード）、郵便番号、都道府県、市町村、番地、建物名、電話番号を入力し、「エントリーする」をクリックするとエントリーが完了し、トップページへ遷移する<br>

・エントリー画面でクレジットカード情報を入力し、「エントリーする」をクリックすると、PAYJPによりカード情報を送信でき、決済が可能<br>
<br>

## ランナー質問投稿ページ
[![Image from Gyazo](https://i.gyazo.com/eb02f5d35daf07a5e67d9bd5b4a02ecd.gif)](https://gyazo.com/eb02f5d35daf07a5e67d9bd5b4a02ecd)
<br>
[![Image from Gyazo](https://i.gyazo.com/671739f4d77a12037b6ae47e453c8af2.gif)](https://gyazo.com/671739f4d77a12037b6ae47e453c8af2)

・ログインユーザーはトップページの「ランナー知恵袋」をクリックすると、質問一覧ページへアクセスできる<br>
・知恵袋のような質問、回答ができるページを作成（質問詳細ページ）<br>
・質問詳細ページでログインユーザーは質問者に対してコメントができるよう機能実装<br>
・投稿者本人がコメントをした場合、コメント枠内の色を他ユーザーと異なる色に実装<br>
  <br>

## 工夫したポイント
①登録ユーザー同志のコミュニケーション活性化のために、いいね機能を実装<br>
②登録ユーザー同士が繋がれるようフォロー、フォロワー機能を実装<br>
③ユーザー特有の悩みをユーザー同士で質問し合える、Q&Aページを作成<br>
④ユーザー同士で集まっての練習会や大会イベントを募集でき、エントリーもできるページを作成<br>
⑤ビューの色味を少なく、明るいブルーとホワイトを基調とした晴れた日の青空をイメージしたデザイン<br>
<br>

## 使用技術
Ruby 2.6.5<br>
Ruby on Rails 6.0.3.7<br>
MySQL  5.6.51<br>
Github  2.30.1<br>
heroku 7.54.0<br>
Visual Studio Code 1.56.2<br>
AWS S3
AWS EC2
<br>

## 課題や今後実装したい機能
・レスポンシブ対応<br>
・ダイレクトメッセージ機能<br>
・通知機能（いいね通知、コメント通知、フォロー通知）<br>
<br>

## DB設計

[![Image from Gyazo](https://i.gyazo.com/7a5882f777ed87c64eb8dd8ba75b4cbe.png)](https://gyazo.com/7a5882f777ed87c64eb8dd8ba75b4cbe)
<br>

## users


| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| nickname           | string   | null: false              |
| email              | string   | null: false, unique: true|
| encrypted_password | string   | null: false              |
| full_name          | string   | null: false              |
| birth_day          | date     | null: false              |
| gender             | string   | null: false              |
| introduce          | text     | null: false              |

has_many :tweets
has_many :comments
has_many :events
has_many :likes
has_many :questions
has_many :answers
has_many :registrations

has_many :active_relationships, class_name: 'Follow', foreign_key: 'user_id'
has_many :passive_relationships, class_name: 'Follow', foreign_key: 'target_user_id'
has_many :followings, through: :active_relationships, source: :target_user
has_many :followers, through: :passive_relationships, source: :user

## follows

| Column      | Type       | Options
| ------------| ---------- | ----------
| user        | references | foreign_key: true
| target_user | references | foreign_key: false

belongs_to :user
belongs_to :target_user, class_name: 'User', foreign_key: 'target_user_id'


## tweets

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| text               | text       | null: false              |
| user               | references | foreign_key: true        |

has_many :comments
has_many :likes
has_many_attached :images
belongs_to :user


## comments

| Column            | Type       |  Options          |
| ------------------| -----------| ----------------- |
| comment           | text       | null :false       |
| tweet             | references | foreign_key: true |
| user              | references | foreign_key: true |

belongs_to :tweet
belongs_to :user


## likes

| Column  | Type       | Options           |
| --------| ---------- | ----------------- |
| user    | references | foreign_key: true |
| tweet   | references | foreign_key: true |

belongs_to :user
belongs_to :tweet

## sns_credential

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| provider | string     |                   |
| uid      | string     |                   |
| user     | references | foreign_key: true |
 
 belongs_to :user


## questions

| Column | Type       | Options            |    
| -------| ---------- | ------------------ | 
| title  | string     |  null: false       | 
| post   | text       |  null: false       | 
| user   | references |  foreign_key: true |

has_many: answers, dependent: :destroy
belongs_to :user


## answers

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| message  | text       | null: false       |
| question | references | foreign_key: true |

belongs_to :user
belongs_to :question


## addresses 

| Column        | Type       | Options              |
| --------------| ---------- | -------------------- |
| postal_code   | string     | null: false          |
| prefecture_id | integer    | null: false          |
| city          | string     | null: false          |
| place_number  | string     | null: false          |
| building_name | string     |                      |
| phone_number  | integer    | null: false          |
| registration  | references | foreign_key: true    |

belongs_to :registration

## events 

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| event_name         | string     | null: false       |
| fee                | integer    | null: false       |
| description        | text       | null: false       |
| category_id        | integer    | null: false       |
| prefecture_id      | integer    | null: false       |
| place_number       | string     | null: false       |
| place_name         | string     | null: false       |
| event_date         | date       | null: false       |
| start_time         | time       | null: false       |
| finish_time        | time       | null: false       |
| deadline           | date       | null: false       | 
| user               | references | foreign_key: true |

belongs_to :user
has_many :registrations
has_one_attached :image

## registrations


| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| event     | references | foreign_key: true |

belongs_to :user
belongs_to :event
has_one: address
