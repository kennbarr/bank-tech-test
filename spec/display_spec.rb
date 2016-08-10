require 'display'

describe Display do

  describe "#statement" do

    let(:transaction1) { double :transaction1, date: Time.new(2016, 8, 9),
                                              amount: 100,
                                              balance: 100 }
    let(:transaction2) { double :transaction2, date: Time.new(2016, 8, 10),
                                              amount: -50,
                                              balance: 50 }
    let(:log) { double :log, history: [transaction1, transaction2] }
    subject(:display) { described_class.new(log) }

    it "prints a statement from account transactions" do
      statement =
      "date || credit || debit || balance ||\n"\
      "10/08/2016 || || 50.00 || 50.00 ||\n"\
      "09/08/2016 || 100.00 || || 100.00 ||\n"
      expect(display.statement).to eq statement
    end

  end

end
