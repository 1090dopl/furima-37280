class RrenameCatogolyIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items,:categoly_id,:category_id
    rename_column :items,:status_id,:item_status_id
  end
end

