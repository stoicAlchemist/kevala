require "application_system_test_case"

class ShiftsTest < ApplicationSystemTestCase
  setup do
    @shift = shifts(:one)
  end

  test "visiting the index" do
    visit shifts_url
    assert_selector "h1", text: "Shifts"
  end

  test "should create shift" do
    visit shifts_url
    click_on "New shift"

    fill_in "Assigned employee", with: @shift.assigned_employee_id
    fill_in "Ends at", with: @shift.ends_at
    fill_in "Location", with: @shift.location_id
    fill_in "Position", with: @shift.position
    fill_in "Starts at", with: @shift.starts_at
    click_on "Create Shift"

    assert_text "Shift was successfully created"
    click_on "Back"
  end

  test "should update Shift" do
    visit shift_url(@shift)
    click_on "Edit this shift", match: :first

    fill_in "Assigned employee", with: @shift.assigned_employee_id
    fill_in "Ends at", with: @shift.ends_at
    fill_in "Location", with: @shift.location_id
    fill_in "Position", with: @shift.position
    fill_in "Starts at", with: @shift.starts_at.to_s
    click_on "Update Shift"

    assert_text "Shift was successfully updated"
    click_on "Back"
  end

  test "should destroy Shift" do
    visit shift_url(@shift)
    click_on "Destroy this shift", match: :first

    assert_text "Shift was successfully destroyed"
  end
end
