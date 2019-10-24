require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  
  def execute_transaction
    
    if self.valid? && self.status != "complete" && self.sender.balance - self.amount > 0
      self.helper(self.sender, self.receiver)
      #self.sender.balance -= self.amount
      #self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  
  end
  
  # def helper(from, to)
  #   from.balance -= amount
  #   to.balance += amount
  # end
  
  def reverse_transfer
    if self.status == "complete"
      self.helper(self.receiver, self.sender)
      #self.receiver.balance -= self.amount
      #self.sender.balance += self.amount
      self.status = "reversed"
    else
      "I can only reverse executed transfers!"
    end
  end
  
end
