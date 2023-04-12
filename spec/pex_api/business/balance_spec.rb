RSpec.describe PexApi::Business::Balance
  # # Get the current balance of your PEX business account. 
  # #
  # # Returns http response
  # def self.call
  #   ::PexApi::Client::Token.new.get("Business/Balance")
  # end
  it "call Client::Token" do
    VCR.use_cassette("pex_business_balance") do
      expect(::PexApi::Client::Token).to receive(:new).once
      PexApi::Business::Balance.call
    end
  end

  it "calls Https" do
    VCR.use_cassette("pex_business_balance") do
      response = PexApi::Business::Balance.call
      expect(response.code).to eq(200)
      expect(JSON.parse(response.body)).to be_a(Hash)
    end
  end


end

