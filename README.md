# README

## アプリケーション名
<h2>RUN Tweet</h2>

## 概要
いつも孤独に走る市民ランナーが多くのランナーと交流できる市民ランナー専用コミュニティサイト

## 本番環境

## 制作背景(意図)
ランナー人口はこの20年で約400万人増加し、国内でランニングを人は1000万人近くといわれています。<br>
①新型コロナウイルスの状況で、ウォーキングやランニングに取り組む人が20%近く増加<br>
②年代別では20代の女性、30代の男性で増加率が最も高い<br>
③20〜30代男女の国内SNSの利用率がもっと多く、ランナー間では写真投稿に特化したInstagramで特に利用者が多い<br>
以上の理由が、本アプリケーションを制作するに至った背景です。

## 機能一覧

ユーザー登録、ログイン機能(devise)<br>
SNSアカウント登録、ログイン機能<br>
ユーザ編集機能<br>
複数枚画像投稿機能<br>
画像プレビュー機能<br>
画像スライドショー機能(Slick)<br>
いいね機能(Ajax)<br<>
いいね数表示機能<br>
いいね一覧機能<br>
ユーザーフォロー機能<br>
フォロー一覧機能<br>
フォロワー一覧機能<br>
投稿編集機能<br>
投稿削除機能<br>
コメント投稿機能<br>
コメント削除<br>
イベント募集機能<br>
イベント編集機能<br>
イベント削除機能<br>
イベント申し込み機能<br>
ActiveHash機能<br>
Formオブジェクト機能<br>
PAYJPクレジットカード決済機能<br>


## DEMO

## トップページ（投稿一覧画面）
[![Image from Gyazo](https://i.gyazo.com/6cef4b408c16d0593ad93de8b0bb5363.gif)](https://gyazo.com/6cef4b408c16d0593ad93de8b0bb5363)

トップページでは、全ユーザーの投稿が降順で閲覧できる<br>
各々の投稿にいいねすることができ、一度したいいねを解除することも可能<br>
複数画像投稿はスライドショー形式で閲覧できる<br>


## ユーザー新規登録画面
[![Image from Gyazo](https://i.gyazo.com/55d05471f6bf004f69268b2dea4f1cd8.gif)](https://gyazo.com/55d05471f6bf004f69268b2dea4f1cd8)

<h3>実装した機能：</h3>
SNSアカウント登録機能

## ユーザーログイン画面
[![Image from Gyazo](https://i.gyazo.com/1fd672aaa773e94d4d74577766ee6b5a.gif)](https://gyazo.com/1fd672aaa773e94d4d74577766ee6b5a)

<h3>実装した機能：</h3>
SNSアカウントログイン機能<br>

## 新規投稿画面
[![Image from Gyazo](https://i.gyazo.com/bcb50c4df3faf6f99164340f5aeb180e.gif)](https://gyazo.com/bcb50c4df3faf6f99164340f5aeb180e)


画像プレビュー機能<br>
画像複数投稿機能

## 投稿詳細画面
[![Image from Gyazo](https://i.gyazo.com/3c186e44d860b9e97dcacb7d3f7d32de.gif)](https://gyazo.com/3c186e44d860b9e97dcacb7d3f7d32de)
[![Image from Gyazo](https://i.gyazo.com/fdd2581e2004dea34a32789e314e4a08.gif)](https://gyazo.com/fdd2581e2004dea34a32789e314e4a08)


コメント投稿機能<br>
いいねしたユーザー一覧ページへアクセス

## ユーザー詳細画面（マイページ）
[![Image from Gyazo](https://i.gyazo.com/ed1d5d0c952fb40796b1e15cbae8c550.gif)](https://gyazo.com/ed1d5d0c952fb40796b1e15cbae8c550)
[![Image from Gyazo](https://i.gyazo.com/6ca371e4aea93382a3257a06478dcfd9.gif)](https://gyazo.com/6ca371e4aea93382a3257a06478dcfd9)


ユーザーフォロー機能<br>
ユーザーフォロー削除機能<br>
フォロー及びフォロワー一覧ページへのアクセス<br>


## イベント新規投稿画面
[![Image from Gyazo](https://i.gyazo.com/2153f2b21174b582aa6a2dff9c64c551.gif)](https://gyazo.com/2153f2b21174b582aa6a2dff9c64c551)


入力した料金を非同期で自動計算させる機能<br>


## イベントエントリー画面
[![Image from Gyazo](https://i.gyazo.com/3550a96658f23a768af7842fa95d2d9f.gif)](https://gyazo.com/3550a96658f23a768af7842fa95d2d9f)
[![Image from Gyazo](https://i.gyazo.com/691aa2f99c92da6d9ae79556fd834ac6.gif)](https://gyazo.com/691aa2f99c92da6d9ae79556fd834ac6)
[![Image from Gyazo](https://i.gyazo.com/157625f76c2aadee141f529cdaca68c6.gif)](https://gyazo.com/157625f76c2aadee141f529cdaca68c6)


住所の入力
エントリー費用の支払い方法は、PAYJPによるクレジットカード決済機能を使用する<br>
ActiveHash機能<br>
Formオブジェクト(usersテーブルとaddressesテーブル)<br>

## ランナー質問投稿ページ
[![Image from Gyazo](https://i.gyazo.com/eb02f5d35daf07a5e67d9bd5b4a02ecd.gif)](https://gyazo.com/eb02f5d35daf07a5e67d9bd5b4a02ecd)
[![Image from Gyazo](https://i.gyazo.com/671739f4d77a12037b6ae47e453c8af2.gif)](https://gyazo.com/671739f4d77a12037b6ae47e453c8af2)

知恵袋のような質問、回答ができるページを作成。<br>
質問詳細ページでログインユーザーは質問者に対してコメントができるよう機能実装。<br>
投稿者本人がコメントをした場合、コメント枠内の色を他ユーザーと異なる色にした。<br>


## 工夫したポイント
①色味を少なく明るいブルーとホワイトを貴重としたしたシンプルで見やすいデザイン<br>
①市民ランナーに必要と思われる、Q&Aページ、大会、練習会を募集できかるエントリーできるページの作成<br>




## 使用技術

## 課題や今後実装したい機能


## DB設計


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
has_one  :address
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


has_many :posts
has_many: comments
has_many :items
has_many :orders
has_one :address


## tweets

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| text               | text       | null: false              |
| user               | references | foreign_key: true        |

has_many :comments
has_many :likes
has_many_attached
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


## question

| Column | Type       | Options            |    
| -------| ---------- | ------------------ | 
| title  | string     |  null: false       | 
| post   | text       |  null: false       | 
| user   | references |  foreign_key: true |

has_many: answers, dependent: :destroy
belongs_to :user


## answer

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
| user          | references | foreign_key: true    |

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
