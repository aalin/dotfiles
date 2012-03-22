require 'shellwords'

def colorize_diff(diff)
  {
    /^<.*/ => "\e[32m\\0\e[0m",
    /^>.*/ => "\e[31m\\0\e[0m",
    /^Only\sin\s.*/ => "\e[31m\\0\e[0m",
    /^Common\ssubdirectories\s.*/ => "\e[34m\\0\e[0m"
  }.inject(diff) do |str, (pattern, replacement)|
    str.gsub(pattern, replacement)
  end
end

def diff?(source_path, destination_path)
  cmd = ['diff', '-r', source_path, destination_path].shelljoin
  output = `#{ cmd }`.strip

  if output.strip.empty?
    false
  else
    print "\e[2J" # clear screen
    puts colorize_diff(output)
    true
  end
end

def write?(source_path, destination_path)
  return true unless File.exists?(destination_path)
  return false unless diff?(source_path, destination_path)

  loop do
    print "Do you want to overwrite #{ destination_path }? (y/n) "
    case $stdin.gets.strip
    when /^y/
      return true
    when /^n/
      return false
    end
  end
end

desc "Install the FILES!"
task :install do
  system("git submodule init > /dev/null")
  system("git submodule update > /dev/null")

  {
    "gitconfig"       => "~/.gitconfig",
    "gitignore"       => "~/.gitignore",
    "gvimrc"          => "~/.gvimrc",
    "inputrc"         => "~/.inputrc",
    "irbrc"           => "~/.irbrc",
    "pryrc"           => "~/.pryrc",
    "vimrc"           => "~/.vimrc",
    "zshrc"           => "~/.zshrc",
    "aliases"         => "~/.aliases",
    "tmux.conf"       => "~/.tmux.conf",
    "aalin.zsh-theme" => "~/.oh-my-zsh/themes/aalin.zsh-theme"
  }.each do |source, destination|
    source_path = File.join(File.dirname(__FILE__), source)
    destination_path = File.expand_path(destination)

    if write?(source_path, destination_path)
      puts "Copying #{ source_path } to #{ destination_path }"
      FileUtils.copy(source_path, destination_path)
    end
  end

  vim_source = File.join(File.dirname(__FILE__), "vim")
  vim_target = File.expand_path("~/.vim")
  if write?(vim_source, vim_target)
    FileUtils.rm_rf(vim_target)
    FileUtils.cp_r(vim_source, vim_target)
  end

  has_rvm = system "which rvm 1> /dev/null"
  command_t_path = File.expand_path("~/.vim/bundle/Command-T/ruby/command-t/")
  unless File.exists?(File.join(command_t_path, "ext.bundle"))
    Dir.chdir(command_t_path) do
      build_commands = []
      build_commands << "rvm use system >> /dev/null" if has_rvm
      build_commands << "rake make > /dev/null"

      unless system(build_commands.join(" && "))
        puts "\e[31mCould not build Command-T. Do it yourself!\e[0m"
        puts "  \e[33mcd #{ command_t_path }; rake make\e[0m"
      end
    end
  end
end
