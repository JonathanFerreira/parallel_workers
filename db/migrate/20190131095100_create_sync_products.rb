class CreateSyncProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :sync_products do |t|
      t.string :state, index: true, default: 'pending'

      t.timestamps
    end
  end
end
