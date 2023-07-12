class AccountsController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :set_account, only: %i[ show edit update destroy ]

  # def index
  #   @accounts = Account.all
  # end

  def create
    @account = Account.new(account_params)
    @account.save     
  end

  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @account.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:first_name, :last_name, :type, :password_digest, :username, :email)
  end
end
