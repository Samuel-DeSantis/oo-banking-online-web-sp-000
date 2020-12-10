class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  PENDING, COMPLETE, REVERESED = "pending", "complete", "reversed"

  @@transfers = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
    else
      puts "Transaction rejected. Please check your account balance."
    end
    transfer_history
    @status = COMPLETE
  end

  def reverse_transfer
    past_transfer = @@transfers.pop
    if past_transfer.status == COMPLETE
    @sender.balance += past_transfer.amount
    @receiver.balance -= past_transfer.amount
    @status = REVERESED
  end

  def transfer_history
    @@transfers << self
  end
end
