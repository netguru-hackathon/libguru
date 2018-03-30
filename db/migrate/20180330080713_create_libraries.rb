class CreateLibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :libraries do |t|
      t.string :name, null: false
      t.string :url

      t.timestamps
    end
  end
end
