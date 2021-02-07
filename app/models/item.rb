class Item < ApplicationRecord
  
  belongs_to :genre, optional: true
  
  has_many :details, dependent: :destroy
  
  has_many :cart_items, dependent: :destroy
  
end
