require 'spec_helper'

describe ClientExec::License do
  let(:faraday_request_stub) { Faraday::Adapter::Test::Stubs.new }
  let(:license)              { ClientExec::License.new }
  let(:license_domain_path)  { '/license/domain.com' }

  before do
    license.instance_variable_get(:@conn).builder.
      swap Faraday::Adapter::NetHttp,
        Faraday::Adapter::Test, faraday_request_stub
  end

  def client_exec_response body
    [200, {}, response_body]
  end

  describe '#add' do
    let(:response_body) { {:error => false, :remaining => 208} }
    before do
      faraday_request_stub.
        post(license_domain_path) { client_exec_response(response_body) }
    end

    it 'should allots a license' do
      license.add 'domain.com'
      faraday_request_stub.verify_stubbed_calls
    end

    it 'returns the Client Exec response' do
      response = license.add 'domain.com'
      response.should == response_body
    end
  end

  describe '#delete' do
    let(:response_body) { {:error => false, :deleted_license => 'domain.com'} }
    before do
      faraday_request_stub.
        delete(license_domain_path) { client_exec_response(response_body) }
    end

    it 'should delete a license form a reseller\'s allotment' do
      license.delete 'domain.com'
      faraday_request_stub.verify_stubbed_calls
    end

    it 'returns the Client Exec response' do
      response = license.delete 'domain.com'
      response.should == response_body
    end
  end

  describe '#get' do
    let(:response_body) { {:error => false, :domain => 'domain.com'} }
    before do
      faraday_request_stub.
        get(license_domain_path) { client_exec_response(response_body) }
    end

    it 'should return a information on a single license' do
      license.get 'domain.com'
      faraday_request_stub.verify_stubbed_calls
    end

    it 'returns the Client Exec response' do
      response = license.get 'domain.com'
      response.should == response_body
    end
  end
end
