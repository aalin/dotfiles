begin
  require 'rubygems'
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

IRB.conf[:PROMPT_MODE] = :CLASSIC

IRB.conf[:PROMPT_MODE] = :RAILS_ENV
IRB.conf[:PROMPT][:RAILS_ENV] = IRB.conf[:PROMPT][:CLASSIC].merge(:PROMPT_I => lambda { (defined?(Rails) ? "#{Rails.env} " : "") + "%N(%m):%03n:%i> " })

class IRB::Irb
  alias :original_prompt :prompt
  def prompt(prompt, ltype, indent, line_no)
    prompt = prompt.call if prompt.respond_to?(:call)
    original_prompt(prompt, ltype, indent, line_no)
  end
end
