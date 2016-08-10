require 'account'

describe Account do

  subject(:account) { described_class.new }

  describe "#deposit" do
    it "can deposit money into the account" do
      account.deposit(10)
      expect(account.balance).to eq 10
    end

    it "tells the transaction log to log the deposit" do
      transactions = spy('transactions')
      account2 = described_class.new(transactions)

      account2.deposit(10)
      expect(transactions).to have_received :log
    end
  end

  describe "#withdraw" do
    it "can withdraw money from the account" do
      account.withdraw(10)
      expect(account.balance).to eq -10
    end

    it "tells the transaction log to log the withdrawal" do
      transactions = spy('transactions')
      account2 = described_class.new(transactions)

      account2.withdraw(10)
      expect(transactions).to have_received :log
    end
  end

  describe "#statement" do
    it "calls the statement method of the display object" do
      transactions = spy('transactions')
      display = spy('display')
      account2 = described_class.new(transactions, display)

      account2.statement
      expect(display).to have_received :statement
    end
  end

end
