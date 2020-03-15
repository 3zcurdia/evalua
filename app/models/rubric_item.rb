# frozen_string_literal: true

# == Schema Information
#
# Table name: rubric_items
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  rubric_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  min_score  :integer          default("0")
#  max_score  :integer          default("3")
#

class RubricItem < ApplicationRecord
  belongs_to :rubric, inverse_of: :rubric_items
  has_many :item_categories, inverse_of: :rubric_item, dependent: :destroy
  accepts_nested_attributes_for :item_categories

  validates :name, :rubric, presence: true

  after_initialize :set_categories

  def set_categories
    return if item_categories.any?

    item_categories.build(weight: 3, name: 'Excelent')
    item_categories.build(weight: 2, name: 'Good')
    item_categories.build(weight: 1, name: 'Regular')
    item_categories.build(weight: 0, name: 'Bad')
  end
end
