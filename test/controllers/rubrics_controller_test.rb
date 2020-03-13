# frozen_string_literal: true

require 'test_helper'

class RubricsControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #   @user = users(:one)
  #   @rubric = rubrics(:one)
  # end
  #
  # test 'should get index' do
  #   sign_in_as
  #   get rubrics_url
  #   assert_response :success
  # end
  #
  # test 'should get new' do
  #   get new_rubric_url, session: { user_id: users(:one).id }
  #   assert_response :success
  # end
  #
  # test 'should create rubric' do
  #   assert_difference('Rubric.count') do
  #     post rubrics_url, params: { rubric: { name: @rubric.name }, session: { user_id: users(:one).id } }
  #   end
  #
  #   assert_redirected_to rubric_url(Rubric.last)
  # end
  #
  # test 'should show rubric' do
  #   get rubric_url(@rubric), session: { user_id: users(:one).id }
  #   assert_response :success
  # end
  #
  # test 'should get edit' do
  #   get edit_rubric_url(@rubric), session: { user_id: users(:one).id }
  #   assert_response :success
  # end
  #
  # test 'should update rubric' do
  #   patch rubric_url(@rubric), params: { rubric: { name: @rubric.name } }, session: { user_id: users(:one).id }
  #   assert_redirected_to rubric_url(@rubric)
  # end
  #
  # test 'should destroy rubric' do
  #   assert_difference('Rubric.count', -1) do
  #     delete rubric_url(@rubric), session: { user_id: users(:one).id }
  #   end
  #
  #   assert_redirected_to rubrics_url
  # end
end
