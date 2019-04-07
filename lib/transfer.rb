class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender,receiver,amount)
    @status = "pending"
    @amount = amount
    @sender= sender
    @receiver = receiver
  end

def valid?
  sender.valid? && receiver.valid?
end

def execute_transaction
  if @status == "pending" && amount < sender.balance && sender.valid?
    receiver.deposit(amount)
    sender.deposit(-amount)
    @status="complete"
  else
    @status= "rejected"
    return "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status == "complete"
    @receiver.deposit(-amount)
    @sender.deposit (amount)
    @status = "reversed"
  end


end


end
