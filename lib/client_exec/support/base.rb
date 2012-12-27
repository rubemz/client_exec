module ClientExec
  class Base

    def initialize
      check_config!
      @conn = Faraday.new(:url => ClientExec.config[:base_uri]) do |c|
        c.request  :url_encoded
        c.response :json
        c.adapter  :net_http
      end
    end

    # Public: Indicates whether the request was successful or not
    #
    # Returns boolean
    def successful?
      @success
    end

    # Public: Peforms an HTTP Request
    #
    # request_method - The HTTP request method for the #request.
    # (:get/:post/:delete etc)
    # path           - URL path
    # options        - HTTP query params
    #
    # Examples
    #
    #   request :get, '/something.json' # GET /seomthing.json
    #   request :put, '/something.json', :something => 1
    #     # PUT /something.json?something=1
    #
    # Returns the parsed json response
    def request(request_method, path, options = {})
      @conn.basic_auth ClientExec.config[:username],
                       ClientExec.config[:password]
      response = @conn.send(request_method, path, options)
      @success = response.body.fetch("error", "false").to_s == 'false'

      response.body
    end

    private

    # Private: Raises an error if a request is made without first calling
    # ClientExec.config
    def check_config!
      raise NoConfig, "ClientExec.config must be specified" if ClientExec.
        config.empty?
    end
  end
end
