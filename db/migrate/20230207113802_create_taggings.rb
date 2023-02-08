class CreateTaggings < ActiveRecord::Migration[7.0]
  def change
    create_table :taggings do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :inventory_entry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
