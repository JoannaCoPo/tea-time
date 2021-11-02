class CreateTea < ActiveRecord::Migration[6.1]
  def change
    create_table :teas do |t|
      t.string :name
      t.string :description
      t.string :origin
      t.integer :brew_time

      t.timestamps
    end
  end
end
