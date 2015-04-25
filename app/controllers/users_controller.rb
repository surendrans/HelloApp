class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def invitations
    user = User.find params[:id].to_i
    render json: {data: user.invitations}
  end

def login
  user = User.where(email: params[:email], password: params[:password]).first
  if user
    data = { status: 200, id: user.id }
  else
    data = { status: 404, message: "User not found"}
  end

  render json: data
end

  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
      
        # format.json { render :show, status: "Success", location: @user }
        qr_url = "https://helloapph.herokuapp.com/qr_codes/#{@user.email}.png"
        render json: @user.attributes.merge!(qr_url: qr_url), status: :created, status_message: "success"
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
     #if request.format.symbol == :json
       params.permit(:name, :email, :phone_number, :password)
     #else
      #params.require(:user).permit(:name, :email, :phone_number)
     #end

      # p request.format.symbol,"-------------"
     # params.permit(:name, :email, :phone_number) if request.format.symbol == :json
     # params.require(:user).permit(:name, :email, :phone_number) if request.format.symbol != :json
    end
end
