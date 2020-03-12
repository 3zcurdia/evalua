# frozen_string_literal: true

require 'test_helper'

class RepositoryEvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repository_evaluation = repository_evaluations(:one)
  end

  test 'should get new' do
    get new_repository_evaluation_url
    assert_response :success
  end

  test 'should create repository_evaluation' do
    assert_difference('RepositoryEvaluation.count') do
      post repository_evaluations_url, params: { repository_evaluation: { name: @repository_evaluation.name, rubric_id: @repository_evaluation.rubric_id } }
    end

    assert_redirected_to repository_evaluation_url(RepositoryEvaluation.last)
  end

  test 'should show repository_evaluation' do
    get repository_evaluation_url(@repository_evaluation)
    assert_response :success
  end

  test 'should get edit' do
    get edit_repository_evaluation_url(@repository_evaluation)
    assert_response :success
  end

  test 'should update repository_evaluation' do
    patch repository_evaluation_url(@repository_evaluation), params: { repository_evaluation: { name: @repository_evaluation.name, rubric_id: @repository_evaluation.rubric_id } }
    assert_redirected_to repository_evaluation_url(@repository_evaluation)
  end
end
