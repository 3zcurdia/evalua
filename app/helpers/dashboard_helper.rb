# frozen_string_literal: true

module DashboardHelper
  def active_menu_class(controller, _action = nil)
    'is-active' if controller_name == controller
  end
end
