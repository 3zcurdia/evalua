# frozen_string_literal: true

class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.string :name, null: false
      t.references :rubric, null: false, foreign_key: true
      t.string :repo_url
      t.string :type

      t.timestamps
    end
  end
end
