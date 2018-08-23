class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
    @user.addresses.build
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    # save goes like usual
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to @user
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json


  def update
    @user = User.find(params[:id])
    # save goes like usual
    if @user.update_attributes(user_params)
      flash[:notice] = "Successfully updated User."
      redirect_to @user and return
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.js {flash.now[:notice] = "Successfully destroyed user."}
      format.html {}
      # flash[:notice] = "Successfully destroyed user."
      # redirect_to users_url
    end
  end


  def search
     if params[:name].present?
      @users = User.search_user(params[:name])
    else
      @users = User.all
    end
  end

  def autocomplete_industry_name
   
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  #   # Never trust parameters from the scary internet, only allow the white list through.

    def user_params
       params.require(:user).permit(:first_name, :last_name, :mobile, :email, addresses_attributes: [:first_line, :second_line, :city, :pin, :state,:_destroy,:id])
    end
end
