class User < ActiveRecord::Base
  has_secure_password

  has_many :prescriptions, foreign_key: "patient_id"

  validates :username, presence: true, uniqueness: true
  validates :name, :age, :gender, presence: true
end
