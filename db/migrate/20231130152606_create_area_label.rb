class CreateAreaLabel < ActiveRecord::Migration[7.1]
  def change
    create_table :area_labels do |t|
      t.references :area, null: false, foreign_key: true
      t.string :name
      t.string :locale


      t.timestamps
    end
    add_index :area_labels, :name
    add_index :area_labels, :locale
    add_index :area_labels, [:locale, :area_id], unique: true

  end
end
