class Location < ApplicationRecord
  has_many :shifts
  def future_unasigned_shifts
    shifts.where(assigned_employee: nil).where("starts_at >= ?", Time.now)
  end

  def assigned_shifts
    shifts.where.not(assigned_employee: nil)
  end
end
