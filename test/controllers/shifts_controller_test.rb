require "test_helper"

class ShiftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shift = shifts(:one)
    @old_shift = shifts(:old_shift)
  end

  test "should get index" do
    get shifts_url
    assert_response :success
  end

  test "should get new" do
    get new_shift_url
    assert_response :success
  end

  test "should create shift" do
    assert_difference("Shift.count") do
      post shifts_url, params: { shift: { assigned_employee_id: @shift.assigned_employee_id, ends_at: @shift.ends_at, location_id: @shift.location_id, position: @shift.position, starts_at: @shift.starts_at } }
    end

    assert_redirected_to shift_url(Shift.last)
  end

  test "should not create shift in the past" do
    assert_no_difference("Shift.count") do
      post shifts_url, params: { shift: { assigned_employee_id: @shift.assigned_employee_id, ends_at: @old_shift.ends_at, location_id: @old_shift.location_id, position: @old_shift.position, starts_at: @old_shift.starts_at } }
    end
  end

  test "should show shift" do
    get shift_url(@shift)
    assert_response :success
  end

  test "should get edit" do
    get edit_shift_url(@shift)
    assert_response :success
  end

  test "should update shift" do
    patch shift_url(@shift), params: { shift: { assigned_employee_id: @shift.assigned_employee_id, ends_at: @shift.ends_at, location_id: @shift.location_id, position: @shift.position, starts_at: @shift.starts_at } }
    assert_redirected_to shift_url(@shift)
  end

  test "should destroy shift" do
    assert_difference("Shift.count", -1) do
      delete shift_url(@shift)
    end

    assert_redirected_to shifts_url
  end
end
