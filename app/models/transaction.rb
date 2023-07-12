class Transaction < ApplicationRecord
  validates :amount, presence: true, numericality: { greater_than: 0 }

  belongs_to :source_wallet, class_name: "Wallet"
  belongs_to :target_wallet, class_name: "Wallet"

  scope :credited, ->(wallet_id) { where(target_wallet_id: wallet_id) }
  scope :debited, ->(wallet_id) { where(source_wallet_id: wallet_id) }

  after_create :update_balance

  private

  def update_balance
    source_wallet.update_attributes(balance: source_wallet.balance - amount)
    target_wallet.update_attributes(balance: target_wallet.balance + amount)
  end
end
