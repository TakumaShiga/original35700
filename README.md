# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| nickname           | string   | null: false              |
| email              | string   | null: false, unique: true|
| encrypted_password | string   | null: false              |
| full_name          | string   | null: false              |
| birth_day          | date     | null: false              |
| gender             | string   | null: false              |
| introduce          | text     |                          |
| profile_image      | string   |                          |

has_many :tweets
has_many: comments
has_many :items
has_many :orders
has_many :likes
has_one :address

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


## addresses 

| Column        | Type       | Options              |
| --------------| ---------- | -------------------- |
| postal_code   | string     | null: false          |
| prefecture_id | integer    | null: false          |
| city          | string     | null: false          |
| house_number  | string     | null: false          |
| building_name | string     |                      |
| phone_number  | integer    | null: false          |
| user          | references | foreign_key: true    |

belongs_to :user

## items 

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| price              | integer    | null: false       |
| description        | text       | null: false       |
| category_id        | integer    | null: false       |
| condition_id       | integer    | null: false       |
| prefecture_id      | integer    | null: false       |
| shipping_burden_id | integer    | null: false       |
| shipping_date_id   | integer    | null: false       |
| user               | references | foreign_key: true |

belongs_to :user
has_many_attached: images
has_one :order

## orders

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

belongs_to :user
belongs_to :item
