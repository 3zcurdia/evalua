# frozen_string_literal: true

class CreateItemCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :item_categories do |t|
      t.string :name
      t.integer :weight
      t.text :summary
      t.references :rubric_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
