require 'transaction_log'

describe TransactionLog do

    subject(:transactions) { described_class.new }
    let(:transaction) { double :transaction }

    describe "#log" do
      it "can log a transaction" do
        transactions.log(transaction)
        expect(transactions.history).to include transaction
      end
    end

  end
