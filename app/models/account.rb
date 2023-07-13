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
    # create wallet with 0 balance, Admin can add balance by transaction API call
    Wallet.create(account_id: self.id, balance: 0, currency: 'INR')
  end

end
