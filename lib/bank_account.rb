require_relative './transfer.rb'


class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit_amount)
    self.balance += deposit_amount
  end

  def display_balance
    self.balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    self.status == "open" && @balance > 0
  end

  def close_account
    self.status = "closed"
  end





end
