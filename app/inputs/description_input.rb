class DescriptionInput < SimpleForm::Inputs::TextInput
  def input_html_options
    super.merge(rows: 10)
  end

  def input_html_classes
    super.push('span10')
  end
end
