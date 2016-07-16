require 'pathname'

module Guess
  def self.guess(working_directory, absolute_file_path, options)
    guesser = BasenameGuesser.new

    guesser.guess(working_directory, absolute_file_path, options)
  end
  
  class Guesser
    def guess(working_directory, absolute_file_path, options)
      raise 'not implemented'
    end
  end
  
  class BasenameGuesser < Guesser
    @@templates_directory = File.join(File.dirname(__FILE__), "../../templates/")
    
    def guess(working_directory, absolute_file_path, options)
      absolute_file_path
      
      basename = Pathname.new(absolute_file_path).basename
      candidate_filename = File.join @@templates_directory, "#{basename}.erb"

      if File.file? candidate_filename
        template_contents = File.read candidate_filename
        [{ :gueser => BasenameGuesser }, template_contents]
      else  
        [{}, nil]
      end
    end    
  end
end
