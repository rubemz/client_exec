require 'client_exec'
require 'json'
require 'fakeweb'
require 'active_support/core_ext'

def mock_request(method, path, options = {})
  uri    = URI.parse(ClientExec.config[:base_uri])
  user = ClientExec.config[:username]
  password = ClientExec.config[:password]
  # http://user:pass@uri.com:80/path
  url    = "#{uri.scheme}://#{user}:#{password}@#{uri.host}:#{uri.port}#{path}"
  FakeWeb.register_uri(method, url, {:content_type => 'application/json'}.
                       merge(options))
end

def mock_client_exec_request(body, path, params = {})
  mock_request(:get, path + params.to_query,
               :status => [200, "OK"], :body => body)
end

def configure_for_tests
  ClientExec.config do |c|
    c.username "username"
    c.password "secret"
    c.base_uri "http://licensedefender.com/api/v1/"
  end
end

RSpec.configure do |c|
  c.before(:each) do
    configure_for_tests
  end
  c.after(:each) do
    ClientExec.reset_config
  end
end
