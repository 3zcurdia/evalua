# frozen_string_literal: true

class AddClosedAtToEvaluations < ActiveRecord::Migration[6.0]
  def change
    add_column :evaluations, :closed_on, :datetime
  end
end
