# frozen_string_literal: true

module ApplicationHelper
  def link_to_add(path:, label: nil, **options)
    link_to(path, options) do
      "<span class='icon'><i class='fa fa-plus-square'></i></span> #{label}".html_safe
    end
  end

  def link_to_edit(path:, label: nil, **options)
    link_to(path, options) do
      "<span class='icon'><i class='fa fa-edit'></i></span> #{label}".html_safe
    end
  end

  def link_to_destroy(path:, label: nil, **options)
    link_to(path, default_delete_options.merge(options)) do
      "<span class='icon'><i class='fa fa-trash'></i></span> #{label}".html_safe
    end
  end

  def default_delete_options
    { method: :delete, data: { confirm: 'Are you sure?' } }
  end
end
