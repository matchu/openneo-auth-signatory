require 'rubygems'
require 'test/unit'
begin
  # Load redgreen, but only if present
  require 'redgreen'
rescue LoadError
end

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'openneo-auth-signatory'

class Test::Unit::TestCase
end
