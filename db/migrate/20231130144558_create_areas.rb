class CreateAreas < ActiveRecord::Migration[7.1]
  def change
    create_table :areas do |t|
      t.bigint :deleted, null:false, default: 0

      t.timestamps
    end
  end
end
