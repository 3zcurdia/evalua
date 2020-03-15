# frozen_string_literal: true

module DashboardHelper
  def active_menu_class(controller, action=nil)
    if controller_name == controller
      'is-active'
    end
  end
end
