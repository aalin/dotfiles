Pry.config.editor = proc { |file, line| "vim +#{line} #{file}" }
