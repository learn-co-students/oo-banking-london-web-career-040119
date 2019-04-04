class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    return unless status == 'pending'

    unless sender.valid? && sender.balance >= amount
      self.status = 'rejected'
      return 'Transaction rejected. Please check your account balance.'
    end

    receiver.deposit(amount)
    sender.deposit(-amount)
    self.status = 'complete'
  end

  def reverse_transfer
    return unless status == 'complete'

    receiver.deposit(-amount)
    sender.deposit(amount)
    self.status = 'reversed'
  end
end
