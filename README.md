#　テーブル設計

## usersテーブル

| Column             | Type         | Options                        |
| ------------------ | ----------   | ------------------------------ |
| nickname           | string       | null: false                    |
| email              | string       | null: false                    |
| encrypted_password | string       | null: false                    |
| family_name        | string       | null: false                    |
| first_name         | string       | null: false                    |
| family_name_kana   | string       | null: false                    |
| first_name_kana    | string       | null: false                    |
| birth_day          | data         | null: false                    |
| introduction       | text         | null: false                    |


### Association

- has_many :items dependent: :destroy
- belongs_to :purchasers dependent: :destroy


## itemsテーブル

| Column             | Type         | Options                        |
| ------------------ | ----------   | ------------------------------ |
| name               | string       | null: false                    |
| price              | string       | null: false                    |
| description        | string       | null: false                    |
| status             | string       | null: false                    |
| shipping_cost      | string       | null: false                    |
| shipping_days      | string       | null: false                    |
| prefecture_id      | integer      | null: false                    |
| category_id        | integer      | null: false, foreign_key: true |
| user_id            | integer      | null: false, foreign_key: true |


### Association

- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy

- has_many :images dependent: :destroy


## imagesテーブル

| Column             | Type         | Options                        |
| ------------------ | ----------   | ------------------------------ |
| images             | string       | null: false                    |
| item_id            | integer      | null: false                    |


### Association

- belongs_to :item


## categoryテーブル

| Column             | Type         | Options                        |
| ------------------ | ----------   | ------------------------------ |
| name               | string       | null: false                    |
| ancestry           | string       |                                |


### Association

- has_many :items


## purchasersテーブル

| Column             | Type         | Options                        |
| ------------------ | ----------   | ------------------------------ |
| family_name        | string       | null: false                    |
| first_name         | string       | null: false                    |
| family_name_kana   | string       | null: false                    |
| first_name_kana    | string       | null: false                    |
| post_code          | string       | null: false                    |
| prefecture         | string       | null: false                    |
| city               | string       | null: false                    |
| address            | string       | null: false                    |
| building_name      | string       | null: false                    |
| phone_numder       | string       | null: false                    |


### Association

- belongs_to :user






