class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id
    validates :sales_status_id
    validates :sipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is out of setting range' }
  end
  # validates :user,foreign_key: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options numericality: { other_than: 1, message: 'Select'} do
    validates :category_id
    validates :sales_status_id
    validates :sipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :sipping_fee_status
end
