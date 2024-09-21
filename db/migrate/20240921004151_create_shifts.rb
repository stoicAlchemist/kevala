class CreateShifts < ActiveRecord::Migration[7.2]
  def change
    create_enum :shift_position, %w[ rn lpn cna ]
    create_table :shifts do |t|
      t.datetime :starts_at, null: false
      t.string :ends_at
      t.enum :position, enum_type: :shift_position, null: false
      t.references :location, null: false, foreign_key: true
      t.references :assigned_employee, null: true, foreign_key: { to_table: :employees }

      t.timestamps
    end
  end
end
