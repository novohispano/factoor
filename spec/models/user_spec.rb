require 'spec_helper'

describe User do
  context "when given the correct params" do
    def valid_params
      {
        name: "Jorge",
        email: "novohispano@gmail.com",
        location: "Monterrey, Mexico",
        provider: "facebook"
      }
    end

    it "creates a user" do
      result = User.create(valid_params)

      expect(result).to be_valid
      expect(result.name).to eq "Jorge"
      expect(result.email).to eq "novohispano@gmail.com"
      expect(result.provider).to eq "facebook"
    end

    it "has a company" do
      user = User.create(valid_params)
      company = Company.create
      user.company = company

      expect(user.company).to eq company
    end

    it "has many invoices" do
      user    = User.create(valid_params)
      invoice = Invoice.create
      user.invoices << invoice

      expect(user.invoices).to include invoice
    end
  end
end