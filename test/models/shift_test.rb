require "test_helper"

class ShiftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "assigned_employee should have the same position" do
    location = Location.create(name: "Location 1")
    employee = Employee.create(name: "Employee rn", position: "rn", location: location)
    shift = Shift.new(
      starts_at: Time.now + 2.days,
      ends_at: Time.now + 3.days,
      location_id: location.id,
      assigned_employee_id: employee.id,
      position: "lpn"
    )

    assert_not shift.save, "assigned to employee with different position"
  end
end
