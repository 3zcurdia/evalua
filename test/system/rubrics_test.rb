# frozen_string_literal: true

require 'application_system_test_case'

class RubricsTest < ApplicationSystemTestCase
  setup do
    @rubric = rubrics(:one)
  end

  test 'visiting the index' do
    visit rubrics_url, session: { user_id: user.id }
    assert_selector 'h1', text: 'Rubrics'
  end

  test 'creating a Rubric' do
    visit rubrics_url
    click_on 'New Rubric'

    fill_in 'Name', with: @rubric.name
    click_on 'Create Rubric'

    assert_text 'Rubric was successfully created'
    click_on 'Back'
  end

  test 'updating a Rubric' do
    visit rubrics_url
    click_on 'Edit', match: :first

    fill_in 'Name', with: @rubric.name
    click_on 'Update Rubric'

    assert_text 'Rubric was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Rubric' do
    visit rubrics_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Rubric was successfully destroyed'
  end
end
