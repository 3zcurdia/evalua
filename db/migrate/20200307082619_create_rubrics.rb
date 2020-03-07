# frozen_string_literal: true

class CreateRubrics < ActiveRecord::Migration[6.0]
  def change
    create_table :rubrics do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
