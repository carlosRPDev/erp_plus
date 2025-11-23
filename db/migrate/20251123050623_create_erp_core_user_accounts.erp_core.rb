# This migration comes from erp_core (originally 20251123227211)
# engines/erp_core/db/migrate/20251124_create_erp_core_user_accounts.rb
class CreateErpCoreUserAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :erp_core_user_accounts do |t|
      t.references :user, null: false, foreign_key: { to_table: :erp_core_users }
      t.references :account, null: false, foreign_key: { to_table: :erp_core_accounts }
      t.boolean :owner, default: false, null: false
      t.timestamps
    end

    add_index :erp_core_user_accounts, [:user_id, :account_id], unique: true, name: "index_erp_core_user_accounts_on_user_and_account"
  end
end
