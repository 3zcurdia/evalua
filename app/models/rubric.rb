# frozen_string_literal: true

# == Schema Information
#
# Table name: rubrics
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rubric < ApplicationRecord
  has_many :rubric_items
  validates :name, presence: true
end
