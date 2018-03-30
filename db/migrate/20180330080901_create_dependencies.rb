class CreateDependencies < ActiveRecord::Migration[5.1]
  def change
    create_table :dependencies do |t|
      t.references :repository
      t.references :library

      t.timestamps
    end
  end
end
