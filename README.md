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

## usersテーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| nickname           | string   | null: false              |
| email              | string   | null: false, unique: true|
| encrypted_password | string   | null: false              |
| full_name          | string   | null: false              |
| birth_day          | date     | null: false              |
| gender             | string   | null: false              |

has_many :posts
has_many: comments
has_many :items
has_many :orders
has_one :address

## posts

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| text               | text       | null: false              |
| user               | references | foreign_key: true        |

has_many :comments
has_many_attached
belongs_to :user


## comments

| Column            | Type       |  Options          |
| ------------------| -----------| ----------------- |
| text              | text       | null :false       |
| post              | references | foreign_key: true |
| user              | references | foreign_key: true |

belongs_to :post
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
