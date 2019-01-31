class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.references :sync_product, foreign_key: true, index: true

      t.timestamps
    end
  end
end
