class Shift < ApplicationRecord
  belongs_to :location
  belongs_to :assigned_employee, class_name: "Employee", optional: true
  validate :assigned_employee_position, on: :create

  enum :position, {
    rn: "rn",
    lpn: "lpn",
    cna: "cna"
  }

  def assigned_employee_position
    errors.add(:assigned_employee_id, "should have the same position") unless position == assigned_employee.position
  end
end
