class FamilyUsersController < ApplicationController
  before_action :set_family_user, only: [:show, :update, :destroy]

  # GET /family_users
  def index
    @family_users = FamilyUser.all

    render json: @family_users
  end

  # GET /family_users/1
  def show
    render json: @family_user
  end

  # POST /family_users
  def create
    @family_user = FamilyUser.new(family_user_params)

    if @family_user.save
      render json: @family_user, status: :created, location: @family_user
    else
      render json: @family_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /family_users/1
  def update
    if @family_user.update(family_user_params)
      render json: @family_user
    else
      render json: @family_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /family_users/1
  def destroy
    @family_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_user
      @family_user = FamilyUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def family_user_params
      params.require(:family_user).permit(:username, :email, :password)
    end
end
