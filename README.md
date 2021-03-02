# README

## usersテーブル

| Column                | Type    | Options                  |
|-----------------------|---------|--------------------------|
| nickname              | string  | null: false              |
| email                 | string  | null: false,unique: true |
| encrypted_password    | string  | null: false              |
| first_name            | string  | null: false              |
| last_name             | string  | null: false              |
| first_name_kana       | string  | null: false              |
| last_name_kana        | string  | null: false              |
| birthday              | date    | null: false              |

### Association

- has_many :items
- has_many :orders


## itemsテーブル

| Column      | Type        | Options                      |
|-------------|-------------|------------------------------|
| name        | string      | null: false                  |
| price       | integer     | null: false                  |
| category_id | integer     | null: false                  |
| brand       | string      | null: false                  |
| condition   | string      | null: false                  |
| user        | references  | null: false, foreign_key     |
| burden      | string      | null: false                  |
| source      | string      | null: false                  |


### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column    | Type        | Options                      |
|-----------|-------------|------------------------------|
| item_id   | references  | null: false, foreign_key     |
| user_id   | references  | null: false, foreign_key     |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addressテーブル

| Column      | Type        | Options                      |
|-------------|-------------|------------------------------|
| orders      | references  | null: false, foreign_key     |
| postcode    | string      | null: false                  |
| city        | string      | null: false                  |
| building    | string      |                              |
| phone_number| string      | null: false                  |

### Association

- belongs_to :order
