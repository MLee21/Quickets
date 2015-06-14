require 'webmock/rspec'
require 'vcr'
WebMock.allow_net_connect!(:net_http_connect_on_start => true)

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.example_status_persistence_file_path = "spec/examples.txt"
  config.disable_monkey_patching!
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end
  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed
  config.backtrace_exclusion_patterns << %r{/gems/}
=end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock
end

