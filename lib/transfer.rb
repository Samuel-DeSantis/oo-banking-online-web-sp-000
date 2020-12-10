class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  @@amounts = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    transfer_memory
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
    end
  end

  def reverse_transfer
    past_amount = @@amounts.pop
    @sender.balance += past_amount
    @receiver.balance -= past_amount
  end

  def transfer_memory
    @@amounts << @amounts
  end
end
