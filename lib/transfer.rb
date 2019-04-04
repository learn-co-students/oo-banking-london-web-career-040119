class Transfer

  attr_accessor :amount, :status
  attr_reader :sender, :receiver


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
    if @status == "pending" && @sender.valid? && @sender.balance >= @amount
      sender.deposit(@amount * -1)
      receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."

    end
  end

    def reverse_transfer
      if @status == "complete"
        sender.deposit(@amount)
        receiver.deposit(@amount * -1)
        @status = "reversed"
      end
    end


end
