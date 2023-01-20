require "test_helper"
require "support/with_clues"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # driven_by :selenium, using: :chrome, screen_size: [1400, 1400] # this is the default
  include TestSupport::WithClues
  driven_by :rack_test
end
