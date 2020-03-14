# frozen_string_literal: true

class AddMinmaxScoresToRubricItem < ActiveRecord::Migration[6.0]
  def change
    add_column :rubric_items, :min_score, :integer, default: 0
    add_column :rubric_items, :max_score, :integer, default: 3
  end
end
