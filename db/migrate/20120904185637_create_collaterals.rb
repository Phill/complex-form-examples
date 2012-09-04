class CreateCollaterals < ActiveRecord::Migration
  def change
    create_table :collaterals do |t|
      t.timestamps
      t.references :attachable, :polymorphic => true
      t.string    :asset_fingerprint
      t.string    :asset_file_name
      t.string    :asset_content_type
      t.integer   :asset_file_size
    end
    add_index :collaterals, :asset_fingerprint
    add_index :collaterals, :attachable_id
    add_index :collaterals, [:attachable_id, :attachable_type]
  end
end
