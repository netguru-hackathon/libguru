class AddCategoryToLibraries < ActiveRecord::Migration[5.1]
  def change
    add_reference :libraries, :category, foreign_key: true
  end
end
