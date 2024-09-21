class Location < ApplicationRecord
  has_many :shifts
  def unasigned_shifts
    shifts.where(assigned_employee: nil)
  end
end
