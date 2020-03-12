# frozen_string_literal: true

require 'application_system_test_case'

class EvaluationsTest < ApplicationSystemTestCase
  setup do
    @evaluation = evaluations(:one)
  end

  test 'visiting the index' do
    visit evaluations_url
    assert_selector 'h1', text: 'Evaluations'
  end

  test 'destroying a Evaluation' do
    visit evaluations_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Evaluation was successfully destroyed'
  end
end
