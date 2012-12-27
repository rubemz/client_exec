require 'spec_helper'

describe ClientExec::Base do
  let(:base)                { ClientExec::Base.new }
  let(:successful_response) { JSON.generate({ 'error' => "false" }) }
  let(:bad_response)        { JSON.generate({ 'error' => "true" }) }

  describe "#successful?" do
    context 'when response error is false' do
      it 'is true' do
        mock_client_exec_request successful_response, '/license'
        base.request(:get, '/license')
        base.should be_successful
      end
    end
    context 'when response error is true' do
      it 'is false' do
        FakeWeb.clean_registry
        mock_client_exec_request bad_response, '/license'
        base.request(:get, '/license')
        base.should_not be_successful
      end
    end
  end

end
