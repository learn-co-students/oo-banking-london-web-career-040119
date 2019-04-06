class Transfer

  attr_accessor :sender, :receiver, :status, :amount
  @@transfer_records = []

  def initialize(sender,receiver,status='pending',amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    return true if sender.valid? && receiver.valid?
    return false
  end

  def execute_transaction
    if !sender.status == 'open' || sender.balance < amount || @@transfer_records.include?(self) || !sender.valid?
      self.status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    elsif sender.valid? && !@@transfer_records.include?(self) && sender.balance>=amount
      sender.deposit(-amount)
      receiver.deposit(amount)
      self.status = 'complete'
      @@transfer_records << self
    end
  end

  def reverse_transfer
    if @@transfer_records.include?(self)
      sender.deposit(amount)
      receiver.deposit(-amount)
      self.status = 'reversed'
    end
  end


end
