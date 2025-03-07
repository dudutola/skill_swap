class Issue < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :user, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :available_on, presence: true
end
