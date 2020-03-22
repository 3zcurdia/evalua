# frozen_string_literal: true

require 'application_system_test_case'

class UserEvaluationsTest < ApplicationSystemTestCase
  setup do
    @user_evaluation = user_evaluations(:one)
  end

  test 'visiting the index' do
    visit user_evaluations_url
    assert_selector 'h1', text: 'User Evaluations'
  end

  test 'creating a User evaluation' do
    visit user_evaluations_url
    click_on 'New User Evaluation'

    fill_in 'Source url', with: @user_evaluation.source_url
    click_on 'Create User evaluation'

    assert_text 'User evaluation was successfully created'
    click_on 'Back'
  end

  test 'updating a User evaluation' do
    visit user_evaluations_url
    click_on 'Edit', match: :first

    fill_in 'Source url', with: @user_evaluation.source_url
    click_on 'Update User evaluation'

    assert_text 'User evaluation was successfully updated'
    click_on 'Back'
  end

  test 'destroying a User evaluation' do
    visit user_evaluations_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'User evaluation was successfully destroyed'
  end
end
