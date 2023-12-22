class AddVatCompanyPhoneBizflagSdiToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :vat, :string
    add_column :users, :company, :string
    add_column :users, :phone, :string
    add_column :users, :bizflag, :boolean, default: false
    add_column :users, :sdicode, :string
  end
end
