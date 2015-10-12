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

def git_clone(repository, path)
  system('git', 'clone', repository, File.expand_path(path))
end

task :default => :install

desc "Install dotfiles"
task :install do
  unless File.exists?("~/.oh-my-zsh")
    git_clone('git://github.com/robbyrussell/oh-my-zsh.git', '~/.oh-my-zsh')
  end

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
    "dircolors"       => "~/.dircolors",
    "aalin.zsh-theme" => "~/.oh-my-zsh/themes/aalin.zsh-theme"
  }.each do |source, destination|
    source_path = File.join(File.dirname(__FILE__), source)
    destination_path = File.expand_path(destination)

    if write?(source_path, destination_path)
      puts "Copying #{ source_path } to #{ destination_path }"
      FileUtils.copy(source_path, destination_path)
    end
  end

  vim_dir = File.expand_path('~/.vim')
  vim_bundle_dir = File.join(vim_dir, 'bundle')
  FileUtils.mkdir_p(vim_bundle_dir)
  vundle_dir = File.join(vim_bundle_dir, 'Vundle.vim')

  unless File.directory?(File.join(vim_bundle_dir, 'Vundle.vim'))
    git_clone('git://github.com/robbyrussell/oh-my-zsh.git', '~/.oh-my-zsh')
    system('vim', '+PluginInstall', '+qall')
  end
end
