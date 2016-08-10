class TransactionLog

  attr_reader :history

  def initialize(history = [])
    @history = history
  end

  def log(transaction)
    @history.push(transaction)
  end

end
