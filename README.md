# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_day       | date   | null: false |

### Association

- has_many :items
- has_many :shipping_addresses

## Items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| iteme_image        | string  | null: false |
| iteme_name         | string  | null: false |
| iteme_content      | text    | null: false |
| iteme_category     | string  | null: false |
| product_condition  | string  | null: false |
| price              | integer | null: false |
| estimated_shipping | integer | null: false |
| shipping_area      | string  | null: false |
| shipping_fee       | string  | null: false |
| seller             | string  | null: false |

### Association

- belongs_to :user
- belongs_to :shipping_adress

## shipping_addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| buyer_name | references | null: false, foreign_key: true |
| item_name  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :purchase_record

## purchase_records テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| post_code     | integer | null: false |
| prefectures   | string  | null: false |
| municipality  | string  | null: false |
| address       | integer | null: false |
| building_name | string  |             |
| phone_number  | integer | null: false |

### Association

- belongs_to :shipping_address