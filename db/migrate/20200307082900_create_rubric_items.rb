# frozen_string_literal: true

class CreateRubricItems < ActiveRecord::Migration[6.0]
  def change
    create_table :rubric_items do |t|
      t.string :name, null: false
      t.references :rubric, null: false, foreign_key: true
      t.json :scores

      t.timestamps
    end
  end
end
