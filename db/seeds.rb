# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

5.times do |i|
  Location.find_or_create_by!(name: "Location #{i}")
end

6.times do |i|
  pos = %w[rn lpn cna].sample
  Employee.find_or_create_by!(
    name: "Employee #{i}",
    location_id: (i % Location.all.size) + 1,
    position: pos
  )
end

10.times do |i|
  pos = %w[rn lpn cna].sample
  start = Time.at(Time.now + rand * (Time.now.end_of_month.to_f - Time.now.to_f))
  end_time = Time.at(start + rand * (start.end_of_month.to_f - start.to_f))
  emp = Employee.all.sample
  loc = Location.all.sample

  Shift.find_or_create_by!(
    starts_at: start,
    ends_at: end_time,
    position: emp.position,
    assigned_employee_id: emp.id,
    location: loc
  )
end
