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

| Column          | Type        | Options                      |
|-----------------|-------------|------------------------------|
| name            | string      | null: false                  |
| price           | integer     | null: false                  |
| category_id     | integer     | null: false                  |
| condition_id    | integer     | null: false                  |
| user            | references  | null: false,foreign_key: true|
| burden_id       | integer     | null: false                  |
| prefecture_id   | integer     | null: false                  |
| days_to_ship_id | integer     | null: false                  |
| item_description| text        | null: false                  |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column    | Type        | Options                        |
|-----------|-------------|--------------------------------|
| item      | references  | null: false, foreign_key: true |
| user      | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column        | Type        | Options                      |
|---------------|-------------|------------------------------|
| order         | references  | null: false, foreign_key:true|
| postcode      | string      | null: false                  |
| city          | string      | null: false                  |
| building      | string      |                              |
| phone_number  | string      | null: false                  |
| prefecture_id | integer     | null: false                  |
| area          | string      | null: false                  |

### Association

- belongs_to :order
