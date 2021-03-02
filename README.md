# README

## usersテーブル

| Column                | Type    | Options     |
|-----------------------|---------|-------------|
| nickname              | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| first_name            | string  | null: false |
| last_name             | string  | null: false |
| first_name_kana       | string  | null: false |
| last_name_kana        | string  | null: false |
| birthday              | date    | null: false |

### Association

- has_many :items
- has_many :orders


## itemsテーブル

| Column      | Type        | Options                      |
|-------------|-------------|------------------------------|
| name        | string      | null: false                  |
| price       | string      | null: false                  |
| category_id | integer     | null: false                  |
| brand       |             | null: false                  |
| condition   |             | null: false                  |
| user_id     | references  | null: false, foreign_key     |
| burden      |             | null: false                  |
| source      |             | null: false                  |
| order_id    | references  | null: false, foreign_key     |
| image       |             | null: false                  |


### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column    | Type        | Options                      |
|-----------|-------------|------------------------------|
| item_id   | references  | null: false, foreign_key     |
| user_id   | references  | null: false, foreign_key     |
| address_id| references  | null: false, foreign_key     |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addressテーブル

| Column      | Type        | Options                      |
|-------------|-------------|------------------------------|
| orders_id   | references  | null: false, foreign_key     |
| postcode    | string      | null: false                  |
| city        | string      | null: false                  |
| building    | string      |                              |
| phone_number| string      | null: false                  |

### Association

- belongs_to :order
