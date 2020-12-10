class Transfer
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.status == "open" && @receiver.status == "open"
  end

  def execute_transaction
    if @sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
    else
      puts "ERROR #=> Balance exceeds withdraw amount."
    end
  end

  def reverse_transfer
  end
end
