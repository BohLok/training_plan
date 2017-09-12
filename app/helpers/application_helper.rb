module ApplicationHelper

  BOOTSTRAP_FLASH_MSG = {
    success: 'alert-success',
    error: 'alert-error',
    alert: 'alert-block',
    notice: 'alert-info'
  }

  # def bootstrap_class_for(flash_type)
  #   BOOTSTRAP_FLASH_MSG.fetch(flash_type, flash_type.to_s)
  # end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible fade show", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }, 'aria-label' => "Close" ) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
        end)
        case
        when bootstrap_class_for(msg_type) == "alert-success"
          concat content_tag(:span, '<i class="fa fa-check-circle"></i>'.html_safe, 'aria-hidden' => true)
        when bootstrap_class_for(msg_type) == ("alert-danger" || "alert-warning")
          concat content_tag(:span, '<i class="fa fa-times-circle"></i>'.html_safe, 'aria-hidden' => true)
        else
          concat content_tag(:span, '<i class="fa fa-info-circle"></i>'.html_safe, 'aria-hidden' => true)
        end
        concat " " + message
      end)
    end
    nil
  end


def errors_for(object)
    if object.errors.any?
        content_tag(:div, class: "card border-danger") do
            concat(content_tag(:div, class: "card-header bg-danger text-white") do
                concat "#{pluralize(object.errors.count, "error")} prohibited this #{object.class.name.downcase} from being saved:"
            end)
            concat(content_tag(:ul, class: 'mb-0 list-group list-group-flush') do
                object.errors.full_messages.each do |msg|
                    concat content_tag(:li, msg, class: 'list-group-item')
                end
            end)
        end
    end
end

def prev_monday(date_str)
  date = Date.parse date_str
  date - date.wday + 1
end



end
