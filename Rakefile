require 'shellwords'

def diff?(source_path, destination_path)
  cmd = ['diff', source_path, destination_path].shelljoin
  output = `#{ cmd }`.strip

  if output.strip.empty?
    false
  else
    print "\e[2J" # clear screen
    puts output.gsub(/^<.*/, "\e[32m\\0\e[0m").gsub(/^>.*/, "\e[31m\\0\e[0m")
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
  {
    "gitconfig" => "~/.gitconfig",
    "gitignore" => "~/.gitignore",
    "gvimrc"    => "~/.gvimrc",
    "inputrc"   => "~/.inputrc",
    "irbrc"     => "~/.irbrc",
    "vimrc"     => "~/.vimrc",
    "zshrc"     => "~/.zshrc",
    "aliases"   => "~/.aliases"
  }.each do |source, destination|
    source_path = File.join(File.dirname(__FILE__), source)
    destination_path = File.expand_path(destination)

    FileUtils.copy(source_path, destination_path) if write?(source_path, destination_path)
  end
end
