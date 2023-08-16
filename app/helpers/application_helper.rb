module ApplicationHelper
    def devise_form_field(form, field_type, field_name, label_text, opts = {})
      content_tag :div, class: 'field' do
        concat form.label field_name, label_text if label_text.present?
        if field_type == :check_box
          concat form.send(field_type, field_name, opts)
        else
          concat form.send(field_type, field_name, { class: 'form-control' }.merge(opts))
        end
      end
    end
  
  def devise_form_submit(form, text, opts = {})
    content_tag :div, class: 'actions' do
      form.submit text, { class: 'btn btn-primary mt-3' }.merge(opts)
    end
  end
end