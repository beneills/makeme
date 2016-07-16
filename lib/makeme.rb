require 'pathname'

require "makeme/fill"
require "makeme/guess"
require "makeme/version"

module Makeme
  def self.run(working_directory, absolute_file_path, options)
    # Check that the file doesn't already exist
    ! File.exist?(absolute_file_path) || founder('File already exists!')
    
    # Test that the file is not a directory
    ! absolute_file_path.end_with?('/') || founder('File is a directory!')

    # Guess which template is right, or nil
    guess_data, template_contents = Guess.guess(working_directory, absolute_file_path, options)
    ! template_contents.nil? || founder('Couldn\'t guess a template for that file!')

    # Fill in template
    contents = Fill.fill(working_directory, absolute_file_path, guess_data, template_contents, options)

    # Write to file
    open(absolute_file_path, 'w') do |f|
      f.write contents
    end

    # Print nice message and exit with success
    puts "Created #{absolute_file_path}" unless options[:silent]
    exit 0
  end
  
  def self.founder(message)
    STDERR.puts message
    exit 1
  end
end
