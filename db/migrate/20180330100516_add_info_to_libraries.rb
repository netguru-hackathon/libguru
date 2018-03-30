class AddInfoToLibraries < ActiveRecord::Migration[5.1]
  def change
    add_column :libraries, :info, :text
  end
end
