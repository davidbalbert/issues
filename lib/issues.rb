module Issues
  ISSUES_DIR = ENV['HOME'] + "/.issues"
end

require 'grit'

require 'issues/version'
require 'issues/tracker'
