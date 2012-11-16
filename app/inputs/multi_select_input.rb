class MultiSelectInput < SimpleForm::Inputs::CollectionSelectInput
  def input_html_classes
    super.push('multi-select')
  end
end
