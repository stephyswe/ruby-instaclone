module PostsHelper
    def input_field_with_errors(form, model, attribute, label_text)
      is_invalid = model.errors.include?(attribute)
      content_tag :div do
        concat form.label attribute, label_text, style: "display: block"
        concat form.text_field attribute, class: "form-control"
        if is_invalid
          concat content_tag(:p, model.errors.full_messages_for(attribute).join(", "), style: "color: red")
        end
      end
    end
  end