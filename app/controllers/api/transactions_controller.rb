class Api::TransactionsController < ApplicationController
  before_action :authorize_request, only: :create
  
  def create
    # current_account is the source of transaction
    if @current_account.wallet.balance >= params[:transaction][:amount].to_f
      @transaction = Transaction.new(transaction_params.merge!(source_wallet_id: @current_account.wallet.id))
      @transaction.save
      render json: @transaction
    else
      render json: message: "Insufficient Balance"
    end
  end

  private
  
  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:amount, :target_wallet_id)
  end
end
