# frozen_string_literal: true

class CreatePoints < ActiveRecord::Migration[6.0]
  def change
    create_table :points do |t|
      t.references :score, null: false, foreign_key: true
      t.references :rubric_item, null: false, foreign_key: true
      t.integer :weight, default: 0

      t.timestamps
    end
  end
end
