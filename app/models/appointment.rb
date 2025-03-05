class Appointment < ApplicationRecord
  belongs_to :tutor, class_name: "User"
  belongs_to :pupil, class_name: "User"
end
