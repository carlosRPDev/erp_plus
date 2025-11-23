# This migration comes from erp_core (originally 20251122216212)
class CreateErpCoreRolePermissions < ActiveRecord::Migration[8.0]
  def change
    create_table :erp_core_role_permissions do |t|
      t.references :role, null: false, foreign_key: { to_table: :erp_core_roles }
      t.references :permission, null: false, foreign_key: { to_table: :erp_core_permissions }
      t.timestamps
    end

    add_index :erp_core_role_permissions, [:role_id, :permission_id], unique: true, name: "index_erp_core_role_permissions_on_role_and_permission"
  end
end
