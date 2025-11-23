# This migration comes from erp_core (originally 20251123217222)
# engines/erp_core/db/migrate/20251124_create_erp_core_accounts.rb
class CreateErpCoreAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :erp_core_accounts do |t|
      t.string :name, null: false
      t.string :subdomain
      t.timestamps
    end

    add_index :erp_core_accounts, :subdomain, unique: true
  end
end
