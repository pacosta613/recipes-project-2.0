class AddCountToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :comments_count, :integer
  end
end
