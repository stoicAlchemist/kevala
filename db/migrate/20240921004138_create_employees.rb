class CreateEmployees < ActiveRecord::Migration[7.2]
  def change
    create_enum :employee_position, %w[rn lpn cna]
    create_table :employees do |t|
      t.string :name, null: false
      t.enum :position, enum_type: :employee_position, null: false
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
