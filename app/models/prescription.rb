class Prescription < ActiveRecord::Base
  belongs_to :patient, class_name: "User"
  belongs_to :medicine

  validates :patient, :medicine, presence: true

  def prescribed_date
    Kronic.format(self.created_at)
  end

  def medicine_name
    self.medicine.name
  end

  def patient_name
    self.patient.name
  end
end
