ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['LOG_COLOR'] ||= 'on'

if ENV['LOG_LEVEL']
  ENV['LOGGER'] ||= 'on'
else
  ENV['LOG_LEVEL'] ||= 'trace'
end

ENV['LOGGER'] ||= 'off'
ENV['LOG_OPTIONAL'] ||= 'on'

puts RUBY_DESCRIPTION

require_relative '../init.rb'

require 'test_bench'; TestBench.activate
require 'pp'
require 'securerandom'

include Mimic
require 'mimic/controls'
require 'mimic/proofs'

def __(text=nil)
  text ||= ''

  unless text.empty?
    text << ' '
  end

  msg = text.ljust(35, '*')
  fail(msg)
end
