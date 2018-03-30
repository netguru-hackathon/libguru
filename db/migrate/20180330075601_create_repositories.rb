class CreateRepositories < ActiveRecord::Migration[5.1]
  def change
    create_table :repositories do |t|
      t.string :name, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
