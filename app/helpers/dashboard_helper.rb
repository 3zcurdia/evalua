# frozen_string_literal: true

module DashboardHelper
  def active_menu_class(controller, _action = nil)
    'is-active' if controller_name == controller
  end

  def progress_bar(percent)
    content_tag :progress, class: 'progress is-primary is-small', value: percent, max: 1.0 do
      "#{percent * 100}%"
    end
  end
end
