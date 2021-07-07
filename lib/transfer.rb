require_relative './bank_account.rb'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @@all << self
  end

  def valid?
    if @sender.valid? && @receiver.valid? && @status == "pending"
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.balance < amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
