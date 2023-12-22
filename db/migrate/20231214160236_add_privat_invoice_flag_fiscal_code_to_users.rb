class AddPrivatInvoiceFlagFiscalCodeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :private_invoice_flag, :boolean, default: false
    add_column :users, :fiscal_code, :string
  end
end
