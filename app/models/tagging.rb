class Tagging < ApplicationRecord
  belongs_to :issue
  belongs_to :tag

  validates :tag, presence: true
  validates :issue, presence: true
end
