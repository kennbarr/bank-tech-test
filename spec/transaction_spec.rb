require 'transaction'

describe Transaction do

  subject(:transaction) { described_class.new(100, Time.new(2016, 8, 10), 100) }

  it "has a transaction date" do
    expect(transaction.date.year).to eq 2016
    expect(transaction.date.month).to eq 8
    expect(transaction.date.day).to eq 10
  end

  it "has an amount" do
    expect(transaction.amount).to eq 100
  end

  it "has a balance" do
    expect(transaction.balance).to eq 100
  end

end
