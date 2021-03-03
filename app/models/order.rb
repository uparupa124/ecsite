class Order < ApplicationRecord
  
  belongs_to :customer
  
  has_many :details, dependent: :destroy
  accepts_nested_attributes_for :details
end
