module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def errors_for(object)
    return unless object.errors.any?

    content_tag(:div, class: "card border-danger") do
      concat(content_tag(:div, class: "card-header bg-danger text-white") do
        concat "#{pluralize(object.errors.count, 'error')} prohibited this #{object.class.name.downcase} from being saved:"
      end)
      concat(content_tag(:ul, class: 'mb-0 list-group list-group-flush') do
        object.errors.full_messages.each do |msg|
          concat content_tag(:li, msg, class: 'list-group-item')
        end
      end)
    end
  end
end
