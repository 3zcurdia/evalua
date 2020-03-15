# frozen_string_literal: true

class AddStateToEvaluation < ActiveRecord::Migration[6.0]
  def change
    add_column :evaluations, :aasm_state, :string
  end
end
