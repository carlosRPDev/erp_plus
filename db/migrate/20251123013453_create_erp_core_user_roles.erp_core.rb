# This migration comes from erp_core (originally 20251123216222)
class CreateErpCoreUserRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :erp_core_user_roles do |t|
      t.references :user, null: false, foreign_key: { to_table: :erp_core_users }
      t.references :role, null: false, foreign_key: { to_table: :erp_core_roles }
      t.bigint :account_id, null: true
      t.timestamps
    end

    add_index :erp_core_user_roles,
              [:user_id, :role_id, :account_id],
              unique: true,
              name: "index_erp_core_user_roles_on_user_role_account"
  end
end
