# frozen_string_literal: true

class AddTitleToUserEvaluation < ActiveRecord::Migration[6.0]
  def change
    add_column :user_evaluations, :title, :string
  end
end
