# README

## usersテーブル

| Column                | Type    | Options     |
|-----------------------|---------|-------------|
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| first_name            | string  | null: false |
| last_name             | string  | null: false |
| first_name_kana       | string  | null: false |
| last_name_kana        | string  | null: false |
| birthday              | date    | null: false |

### Association

- has_many :items
- has_many :orders


## itemsテーブル

| Column    | Type        | Options                      |
|-----------|-------------|------------------------------|
| item      | string      | null: false                  |
| price     | string      | null: false                  |
| category  |             | null: false                  |
| brand     |             | null: false                  |
| condition |             | null: false                  |
| user_id   | references  | null: false, foreign_key     |
| burden    |             | null: false                  |
| source    |             | null: false                  |


### Association

- belongs_to :user
- belongs_to :order

## ordersテーブル

| Column    | Type        | Options                      |
|-----------|-------------|------------------------------|
| item_id   | references  | null: false, foreign_key     |
| user_id   | references  | null: false, foreign_key     |
| address_id| references  | null: false, foreign_key     |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address


## addressテーブル

| Column      | Type        | Options                      |
|-------------|-------------|------------------------------|
| orders_id   | references  | null: false, foreign_key     |
| postcode    | integer     | null: false                  |
| city        | string      | null: false                  |
| building    | string      |                              |
| phone_number| integer     | null: false                  |

### Association

- belongs_to :orders 
