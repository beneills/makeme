require 'erb'

require 'makeme/fill_helpers'

module Fill
  def self.fill(working_directory, absolute_file_path, guess_data, template_contents, options)
    template = ERB.new template_contents, nil, "%"
    fill_helpers = FillHelpers.new(working_directory, absolute_file_path, guess_data)

    template.result(fill_helpers.get_binding)
  end
end
