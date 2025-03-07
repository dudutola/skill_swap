class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :issues, through: :taggings
end
