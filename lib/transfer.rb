class Transfer

  attr_reader :sender, :receiver, :transfer_amount
  attr_accessor :status, :transfer_amount

  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @transfer_amount = transfer_amount
  end

  def valid?
    if @receiver.valid? == true && @sender.valid? == true then true end
  end

  def execute_transaction

  end


end
