module ClientExec
  # Holds the configuration for Client Exec
  class Config
    attr_accessor :config

    def initialize
      @config = {}
    end

    # Public: get the configuration value
    #
    # configuration - the configuration key
    #
    # Returns the configuration value or nil if it has not been set
    def [](configuration)
      @config[configuration]
    end

    # Public: set the base uri for Client Exec resellers API
    #
    # value - uri for Client Exec resellers API
    #
    # Returns the given base uri
    def base_uri(value)
      @config[:base_uri]  = value
    end

    # Public: set the Client Exec reseller UID
    #
    # value - Username for Client Exec resellers API
    #
    # Returns the given username
    def username(value)
      @config[:username] = value
    end

    # Public: set the Client Exec reseller password
    #
    # value - password for Client Exec resellers API
    #
    # Returns the given password
    def password(value)
      @config[:password] = value
    end
  end
end
