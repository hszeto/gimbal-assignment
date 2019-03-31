class CreateCafes < ActiveRecord::Migration[5.2]
  def change
    create_table :cafes do |t|
      t.string :name
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
