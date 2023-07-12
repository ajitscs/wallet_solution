class Api::WalletsController < ApplicationController
  before_action :authorize_request, only: :show
  
  # GET balance
  def show
    wallet = @current_account.wallet
    
    render json: { account_type: @current_account.type, account_id: @current_account.id, balance: wallet.calculated_balance }
  end

  private

  def calculate_balance(user_type, user_id)
    case user_type
    when "Team"
      Team.find_by(id: user_id)&.transactions&.sum(:amount)
    when "Stock"
      Stock.find_by(id: user_id)&.transactions&.sum(:amount)
    else
      nil
    end
  end
end
