require 'faraday'
require 'faraday_middleware'
require 'client_exec/support/version'

module ClientExec
  autoload :Config,  'client_exec/support/config'
  autoload :Base,    'client_exec/support/base'
  autoload :License, 'client_exec/license'

  @configuration ||= ClientExec::Config.new

  # Public: Specificy the config via block
  #
  # base_uri - URL of your Client Exec Resellers API`
  # username - API username
  # password - API Password
  #
  # Examples
  #
  #   ClientExec.config do |c|
  #     c.base_uri 'http://test.com/reseller'
  #     c.username '1234'
  #     c.password 'mypass'
  #   end
  #
  # Returns a Hash
  def self.config
    yield @configuration if block_given?
    @configuration.config
  end

  # Public: Reset the config (aka, clear it)
  def self.reset_config
    @configuration = ClientExec::Config.new
  end

end
