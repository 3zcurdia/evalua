# frozen_string_literal: true

class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.references :evaluation, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :total_points, default: 0
      t.string :source_url

      t.timestamps
    end
  end
end
