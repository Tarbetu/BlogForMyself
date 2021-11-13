class AddInformationToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :information, :text
  end
end
