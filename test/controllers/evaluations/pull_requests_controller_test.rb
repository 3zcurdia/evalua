# frozen_string_literal: true

require 'test_helper'

class Evaluations::PullRequestsControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #   @evaluation = pull_request_evaluations(:one)
  # end
  #
  # test 'should get new' do
  #   get new_pull_request_evaluation_url
  #   assert_response :success
  # end
  #
  # test 'should create pull_request_evaluation' do
  #   assert_difference('Evaluations::PullRequest.count') do
  #     post pull_request_evaluations_url, params: { pull_request_evaluation: { name: @evaluation.name, repo_url: @evaluation.repo_url, rubric_id: @evaluation.rubric_id } }
  #   end
  #
  #   assert_redirected_to pull_request_evaluation_url(Evaluations::PullRequest.last)
  # end
  #
  # test 'should show pull_request_evaluation' do
  #   get pull_request_evaluation_url(@evaluation)
  #   assert_response :success
  # end
  #
  # test 'should get edit' do
  #   get edit_pull_request_evaluation_url(@evaluation)
  #   assert_response :success
  # end
  #
  # test 'should update pull_request_evaluation' do
  #   patch pull_request_evaluation_url(@evaluation), params: { pull_request_evaluation: { name: @evaluation.name, repo_url: @evaluation.repo_url, rubric_id: @evaluation.rubric_id } }
  #   assert_redirected_to pull_request_evaluation_url(@evaluation)
  # end
end
