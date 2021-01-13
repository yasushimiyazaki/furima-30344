# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birthday           | date                | null: false             |

### Association

* has_many :items
* has_many :buys

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| item_name                           | string     | null: false       |
| item_info                           | text       | null: false       |
| item_category                       | string     | null: false       |
| item_sales_status_id                | integer    | null: false       |
| item_sipping_fee_status_id          | integer    | null: false       |
| item_prefecture_id                  | integer    | null: false       |
| item_scheduled_delivery_id          | integer    | null: false       |
| item_price                          | integer    | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buy

## buys table

| Column                              | Type       | Options                 |
|-------------------------------------|------------|-------------------------|
| item_name                           | references | foreign_key: true |
| item_info                           | references | foreign_key: true |
| item_category                       | references | foreign_key: true |
| item_sales_status_id                | references | foreign_key: true |
| item_sipping_fee_status_id          | references | foreign_key: true |
| item_prefecture_id                  | references | foreign_key: true |
| item_scheduled_delivery_id          | references | foreign_key: true |
| item_price                          | references | foreign_key: true |
| user                                | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one : buy_address

## buy_addresses table

| Column                    | Type       | Options           |
|---------------------------|------------|-------------------|
| postal_code               | string     | null: false       |
| prefecture                | string     | null: false       |
| city                      | string     | null: false       |
| addresses                 | string     | null: false       |
| building                  | string     | null: false       |
| phone_number              | string     | null: false       |

### Association

- belongs_to :buy
