class Shift < ApplicationRecord
  belongs_to :location
  belongs_to :assigned_employee, class_name: "Employee", optional: true
  validate :assigned_employee_position, on: :create
  validate :starts_at_future, on: :create

  enum :position, {
    rn: "rn",
    lpn: "lpn",
    cna: "cna"
  }

  def assigned_employee_position
    errors.add(:assigned_employee_id, "should have the same position") unless position == assigned_employee.position
  end

  def starts_at_future
    errors.add(:starts_at, "starts_at should be in the future") unless Time.now < starts_at
  end
end
