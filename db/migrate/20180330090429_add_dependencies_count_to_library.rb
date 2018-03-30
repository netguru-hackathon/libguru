class AddDependenciesCountToLibrary < ActiveRecord::Migration[5.1]
  def change
    add_column :libraries, :dependencies_count, :integer, default: 0, null: false
  end
end
