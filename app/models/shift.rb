class Shift < ApplicationRecord
  belongs_to :location
  belongs_to :assigned_employee, class_name: "Employee"

  enum :position, {
    rn: "rn",
    lpn: "lpn",
    cna: "cna"
  }
end
