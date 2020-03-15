# frozen_string_literal: true

require 'application_system_test_case'

class Evaluations::RepositorysTest < ApplicationSystemTestCase
  setup do
    @repository_evaluation = repository_evaluations(:one)
  end

  test 'creating a Repository evaluation' do
    visit repository_evaluations_url
    click_on 'New Repository Evaluation'

    fill_in 'Name', with: @repository_evaluation.name
    fill_in 'Rubric', with: @repository_evaluation.rubric_id
    click_on 'Create Repository evaluation'

    assert_text 'Repository evaluation was successfully created'
    click_on 'Back'
  end

  test 'updating a Repository evaluation' do
    visit repository_evaluations_url
    click_on 'Edit', match: :first

    fill_in 'Name', with: @repository_evaluation.name
    fill_in 'Rubric', with: @repository_evaluation.rubric_id
    click_on 'Update Repository evaluation'

    assert_text 'Repository evaluation was successfully updated'
    click_on 'Back'
  end
end
