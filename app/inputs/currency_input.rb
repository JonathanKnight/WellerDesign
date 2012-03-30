class CurrencyInput < SimpleForm::Inputs::Base
  include ActionView::Helpers::NumberHelper

  def input
    (number_to_currency @builder.text_field(attribute_name, input_html_options)).html_safe
  end
end

