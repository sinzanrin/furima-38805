#　テーブル設計

## usersテーブル

| Column             | Type         | Options                        |
| ------------------ | ----------   | ------------------------------ |
| nickname           | string       | null: false                    |
| email              | string       | null: false, unique: true      |
| encrypted_password | string       | null: false                    |
| family_name        | string       | null: false                    |
| first_name         | string       | null: false                    |
| family_name_kana   | string       | null: false                    |
| first_name_kana    | string       | null: false                    |
| birth_day          | date         | null: false                    |


### Association

- has_many :items 
- has_many :orders 


## itemsテーブル

| Column             | Type         | Options                        |
| ------------------ | ----------   | ------------------------------ |
| name               | string       | null: false                    |
| price              | integer      | null: false                    |
| description        | text         | null: false                    |
| status_id          | integer      | null: false                    |
| shipping_cost_id   | integer      | null: false                    |
| shipping_day_id    | integer      | null: false                    |
| prefecture_id      | integer      | null: false                    |
| category_id        | integer      | null: false                    |
| user               | references   | null: false, foreign_key: true |


### Association

- belongs_to :user 
- has_one :order


## addressesテーブル（配送先情報）

| Column             | Type         | Options                        |
| ------------------ | ----------   | ------------------------------ |
| post_code          | string       | null: false                    |
| prefecture_id      | integer      | null: false                    |
| city               | string       | null: false                    |
| address            | string       | null: false                    |
| building_name      | string       |                                |
| phone_numder       | string       | null: false                    |
| order              | references   | null: false, foreign_key: true |


### Association

- belongs_to :order


## ordersテーブル（購入履歴）

| Column             | Type         | Options                        |
| ------------------ | ----------   | ------------------------------ |
| user               | references   | null: false, foreign_key: true |
| item               | references   | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_many :address









