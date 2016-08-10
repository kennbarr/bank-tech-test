require_relative "transaction"
require_relative "display"
require_relative "transaction_log"

class Account

  attr_reader :balance

  def initialize(transactions = TransactionLog.new,
                 display      = Display.new(transactions))
    @balance = 0
    @transactions = transactions
    @display = display
  end

  def deposit(amount, date = Time.now)
    @balance += amount
    @transactions.log(Transaction.new(amount, date, balance))
  end

  def withdraw(amount, date = Time.now)
    @balance -= amount
    @transactions.log(Transaction.new(-amount, date, balance))
  end

  def statement
    puts @display.statement
  end

end
