# frozen_string_literal: true

module EvaluationHelper
  def tag_badge_state(state)
    content_tag(:div, class: 'tags has-addons') do
      content_tag(:span, 'Status', class: 'tag') + content_tag(:span, state, class: tag_colors(state))
    end
  end

  def tag_colors(state)
    case state.to_sym
    when :draft
      'tag is-primary'
    when :in_progress
      'tag is-link'
    when :review
      'tag is-dark'
    when :done
      'tag is-success'
    else
      'tag'
    end
  end
end
