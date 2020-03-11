# frozen_string_literal: true

class RenameTableScoresToUserEvaluations < ActiveRecord::Migration[6.0]
  def change
    rename_table :scores, :user_evaluations
    remove_column :points, :score_id
    add_reference :points, :user_evaluations, index: true
  end
end
