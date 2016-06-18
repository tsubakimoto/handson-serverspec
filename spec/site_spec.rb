require "spec_helper"

describe "Site Check" do

  describe server(:docker) do
    describe http("http://docker") do
      it "responds as 'text/html'" do
        expect(response.headers['content-type']).to match(%r{^text/html})
      end
      it "responds as '200'" do
        expect(response.status).to be 200
      end
      it "responds as 'test'" do
        expect(response.body).to include("test")
      end
    end
  end

end
