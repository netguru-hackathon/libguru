class CreateDependencies < ActiveRecord::Migration[5.1]
  def change
    create_table :dependencies do |t|
      t.references :repository, null: false
      t.references :library, null: false

      t.timestamps
    end
  end
end
