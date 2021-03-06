# frozen_string_literal: true

require 'application_system_test_case'

class Evaluations::PullRequestsTest < ApplicationSystemTestCase
  setup do
    @evaluation = pull_request_evaluations(:one)
  end

  test 'creating a Pull request evaluation' do
    visit pull_request_evaluations_url
    click_on 'New Pull Request Evaluation'

    fill_in 'Name', with: @evaluation.name
    fill_in 'Repo url', with: @evaluation.repo_url
    fill_in 'Rubric', with: @evaluation.rubric_id
    click_on 'Create Pull request evaluation'

    assert_text 'Pull request evaluation was successfully created'
    click_on 'Back'
  end

  test 'updating a Pull request evaluation' do
    visit pull_request_evaluations_url
    click_on 'Edit', match: :first

    fill_in 'Name', with: @evaluation.name
    fill_in 'Repo url', with: @evaluation.repo_url
    fill_in 'Rubric', with: @evaluation.rubric_id
    click_on 'Update Pull request evaluation'

    assert_text 'Pull request evaluation was successfully updated'
    click_on 'Back'
  end
end
