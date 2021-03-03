# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_many :shipping_addresses

## Items テーブル

| Column                | Type    | Options                        |
| --------------------- | ------- | ------------------------------ |
| iteme_name            | string  | null: false                    |
| iteme_content         | text    | null: false                    |
| iteme_category_id     | integer | null: false                    |
| product_condition_id  | integer | null: false                    |
| price                 | integer | null: false                    |
| estimated_shipping_id | integer | null: false                    |
| shipping_area_id      | integer | null: false                    |
| shipping_fee_id       | integer | null: false                    |
| user_id               | integer  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| post_code        | string     | null: false                     |
| shipping_area_id | integer    | null: false                     |
| municipality     | string     | null: false                     |
| address          | integer    | null: false                     |
| building_name    | string     |                                 |
| phone_number     | string     | null: false                     |
| purchases        | references | null: false, foreign_key: true  |

### Association

- belongs_to :purchase