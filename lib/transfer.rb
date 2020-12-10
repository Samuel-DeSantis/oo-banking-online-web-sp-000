class Transfer
  attr_accessor :sender, :receiver, :amount, :status

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
    if valid? && @sender.balance > @amount && self.status == "pending"
      transfer_history
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if valid? && @sender.balance > @amount && self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
