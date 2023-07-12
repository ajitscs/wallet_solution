class Account < ApplicationRecord
  has_secure_password # reference https://apidock.com/rails/ActiveModel/SecurePassword/InstanceMethodsOnActivation/authenticate  
  
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  has_one :wallet

  after_create :wallet_creation

  private

  def wallet_creation
    # creating wallet with 50 INR as a basic amount for testing!, ideally this amount should be updated by admin
    # this balance entry also introduce a difference of 50 INR in the wallet balance calculation
    # Solution: Create a transaction from Admin wallet to self wallet for this amount(50)
    wallet = self.create_wallet(balance: 50, currency: 'INR')
    # Transaction.create(amount: 50, source_wallet_id: super_admin.wallet.id, target_wallet_id: wallet.id)
  end

end
