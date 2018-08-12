# frozen_string_literal: true
# ClientSideValidations Initializer

# Disabled validators
ClientSideValidations::Config.disabled_validators = []

# Uncomment to validate number format with current I18n locale
# ClientSideValidations::Config.number_format_with_locale = true

# Uncomment the following block if you want each input field to have the validation messages attached.
#
# Note: client_side_validation requires the error to be encapsulated within
# <label for="#{instance.send(:tag_id)}" class="message"></label>
#
require 'client_side_validations/simple_form' if defined?(::SimpleForm)  
require 'client_side_validations/formtastic' if defined?(::Formtastic)  
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html = %(<div class="field_with_errors">#{html_tag}</div>).html_safe

  form_fields = [
    'textarea',
    'input',
    'select'
  ]

  elements = Nokogiri::HTML::DocumentFragment.parse(html_tag).css "label, " + form_fields.join(', ')

  elements.each do |e|
    if e.node_name.eql? 'label'
      html = %(<div class="control-group error">#{e}</div>).html_safe
    elsif form_fields.include? e.node_name
      if instance.error_message.kind_of?(Array)
        html = %(<div class="control-group error">#{html_tag}<span class="help-inline">&nbsp;#{instance.error_message.uniq.join(', ')}</span></div>).html_safe
      else
        html = %(<div class="control-group error">#{html_tag}<span class="help-inline">&nbsp;#{instance.error_message}</span></div>).html_safe
      end
    end
  end
  html
end
