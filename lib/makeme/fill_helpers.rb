module Internal
  def placeholder(text)
    text.upcase
  end
end

class FillHelpers
  def initialize(working_directory, absolute_file_path, guess_data)
    @working_directory = working_directory
    @absolute_file_path = absolute_file_path
    @guess_data = guess_data
  end
  
  def get_binding
    binding
  end

  def parent_directory
    parent = Pathname.new(@absolute_file_path).parent.basename

    if parent
      parent.to_s
    else
      nil
    end
  end
  
  def heuristic_project
    parent_directory
  end

  def heuristic_username
    Etc.getlogin
  end
  
  def project;  heuristic_project  || Internal.placeholder("myproject"); end
  def username; heuristic_username || Internal.placeholder("username");  end
end
