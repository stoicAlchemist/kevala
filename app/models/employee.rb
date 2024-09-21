class Employee < ApplicationRecord
  belongs_to :location
  has_many :shifts, foreign_key: :assigned_employee_id

  enum :position, {
    rn: "rn",
    lpn: "lpn",
    cna: "cna"
  }

  def future_shifts
    shifts.where("starts_at >= ?", Time.now)
  end
end
