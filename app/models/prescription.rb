class Prescription < ActiveRecord::Base
  belongs_to :patient, class_name: "User"
  belongs_to :medicine

  validates :patient, :medicine, presence: true
end
