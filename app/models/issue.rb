class Issue < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy

  validates :user, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :available_on, presence: true
end
