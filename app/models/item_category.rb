# frozen_string_literal: true

# == Schema Information
#
# Table name: item_categories
#
#  id             :bigint           not null, primary key
#  name           :string
#  weight         :integer
#  summary        :text
#  rubric_item_id :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class ItemCategory < ApplicationRecord
  belongs_to :rubric_item, inverse_of: :item_categories
  validates :name, :weight, presence: true
end
