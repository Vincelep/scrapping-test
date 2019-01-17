require_relative '../lib/00_trad.rb'

describe "return table" do
  it "the type returned is an array" do
    expect(obscur_trader.class).to eq(Array)
  end
  it "the returns something" do
    expect(obscur_trader).not_to be_nil
  end
end