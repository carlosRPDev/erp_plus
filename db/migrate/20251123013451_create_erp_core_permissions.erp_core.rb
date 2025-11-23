# This migration comes from erp_core (originally 20251122216207)
class CreateErpCorePermissions < ActiveRecord::Migration[8.0]
  def change
    create_table :erp_core_permissions do |t|
      t.string :name, null: false
      t.string :description
      t.timestamps
    end

    add_index :erp_core_permissions, :name, unique: true
  end
end
