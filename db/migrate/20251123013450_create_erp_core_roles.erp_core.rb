# This migration comes from erp_core (originally 20251122213207)
class CreateErpCoreRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :erp_core_roles do |t|
      t.string :name, null: false
      t.string :description
      t.bigint :account_id, null: true  # Opcional para multitenancy
      t.timestamps
    end

    add_index :erp_core_roles, [:name, :account_id], unique: true, name: "index_erp_core_roles_on_name_and_account"
  end
end
