class Wallet < ApplicationRecord
  belongs_to :account
  
  def calculated_balance
    Transaction.credited(self.id).select(:amount).sum(:amount) - Transaction.debited(self.id).select(:amount).sum(:amount)
  end
end
