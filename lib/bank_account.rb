class BankAccount

attr_accessor :balance, :status
attr_reader :name

def initialize(name)
  @name = name
  @balance = 1000
  @status = "open"
end

# def name
#   @name
# end
#
def display_balance
  "Your balance is $#{@balance}."
end
#
# def status
#   @status
# end

def deposit(amount)
  @balance += amount
end

def valid?
  if @status == "open" && @balance > 0 then true else false end
end

def close_account
  @status = "closed"
end



end
