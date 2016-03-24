class Medicine < ActiveRecord::Base
  has_many :prescriptions
  belongs_to :active_ingredient

  validates :name, :active_ingredient, :dose, presence: true
end
