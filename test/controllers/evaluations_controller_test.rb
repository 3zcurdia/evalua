# frozen_string_literal: true

require 'test_helper'

class EvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evaluation = evaluations(:one)
  end

  test 'should get index' do
    get evaluations_url
    assert_response :success
  end

  test 'should get new' do
    get new_evaluation_url
    assert_response :success
  end

  test 'should destroy evaluation' do
    assert_difference('Evaluation.count', -1) do
      delete evaluation_url(@evaluation)
    end

    assert_redirected_to evaluations_url
  end
end
