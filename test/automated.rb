require_relative 'test_init'

TestBench::Runner.(
  'automated/**/*.rb',
  exclude_pattern: %r{_init\.rb\z}
) or exit 1
