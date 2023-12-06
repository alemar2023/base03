class CreateBrandLabel < ActiveRecord::Migration[7.1]
  def change
    create_table :brand_labels do |t|
      t.references :brand, null: false, foreign_key: true
      t.string :name
      t.string :locale


      t.timestamps
    end
    add_index :brand_labels, :name
    add_index :brand_labels, :locale
    add_index :brand_labels, [:locale, :brand_id], unique: true
  end
end
