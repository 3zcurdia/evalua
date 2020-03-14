# frozen_string_literal: true

class RemoveScoresFromRubricItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :rubric_items, :scores
  end
end
