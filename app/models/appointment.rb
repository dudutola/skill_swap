class Appointment < ApplicationRecord
  belongs_to :tutor, class_name: "User"
  belongs_to :pupil, class_name: "User"
  belongs_to :issue

  validates :issue, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
