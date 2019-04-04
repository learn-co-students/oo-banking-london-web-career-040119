
require_relative '../lib/transfer.rb'
class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  @@all_accounts = []

  def initialize(name,balance=1000,status='open')
    @name = name
    @balance = balance
    @status = status
    @@all_accounts << self
  end

  def deposit(amount)
    @balance = @balance+amount
  end

  def display_balance
    b = @balance
    return "Your balance is $#{b}."
  end

  def valid?
    return true if self.status == 'open' && self.balance>0
    return false
  end

  def close_account
    self.status = "closed"
  end


  def self.get_all_accounts
    @@all_accounts
  end

end
