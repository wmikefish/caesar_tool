require "spec_helper"
require "caesar"

describe Caesar do
  it "EHOLのROT13がRUBYになること" do
    expect(Caesar.dencrypt("EHOL", 13)).to eq 'RUBY'
  end
end
