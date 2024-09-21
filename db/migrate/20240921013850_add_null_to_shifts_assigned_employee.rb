class AddNullToShiftsAssignedEmployee < ActiveRecord::Migration[7.2]
  def change
    change_column_null :shifts, :assigned_employee_id, true
  end
end
