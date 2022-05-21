class CreateActives < ActiveRecord::Migration[6.0]
  def change
    create_table :actives do |t|
      t.string :storage_blobs

      t.timestamps
    end
  end
end
