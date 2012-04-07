require 'vcr'

VCR.config do |c|
  c.stub_with :webmock
  c.cassette_library_dir     = 'features/cassettes'
  c.ignore_localhost = true
end

# VCR.cucumber_tags do |t|
#   t.tag  '@localhost_request' # uses default record mode since no options are given
#   t.tags '@disallowed_1', '@disallowed_2', :record => :none
# end
