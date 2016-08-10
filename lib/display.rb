class Display

  def initialize(transaction_log)
    @transactions = transaction_log.history
  end

  def statement
    output = "date || credit || debit || balance ||\n"
    @transactions.reverse.each { |t| output += format_line(t) }
    output
  end

  private

  def format_line(t)
    line = t.date.strftime("%d/%m/%Y") + " || " +
    "#{ format("%.2f", t.amount) + " " if t.amount >= 0 }|| " +
    "#{ format("%.2f", -t.amount) + " " if t.amount < 0 }|| " +
    format("%.2f", t.balance) + " ||\n"
  end

end
