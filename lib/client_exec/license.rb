module ClientExec
  class License < Base

    # Public: Allots a license from one of the available in the reseller's pool
    #
    # domain - Domain name that will be added to reseller's allotted licenses
    #
    # Returns a Hash that contains whether was a error or not and the
    # total of remaining domains (required)
    def add(domain)
      request(:post, "/license/#{domain}")
    end

    # Public: Deletes a license from a reseller's allotment
    #
    # domain - Domain name that will be removed from the reseller's
    # allotted licenses (required)
    #
    # Returns a Hash data from client exec api.
    def delete(domain)
      request(:delete, "/license/#{domain}")
    end

    # Public: Returns information on a single license
    #
    # domain - Domain name that a license is tied to (required)
    #
    # Returns a Hash data from client exec api.
    def get(domain)
      request(:get, "/license/#{domain}")
    end
  end
end
