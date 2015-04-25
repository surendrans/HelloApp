class CompanyUsersController < ApplicationController
  before_action :set_company_user, only: [:show, :edit, :update, :destroy]

  # GET /company_users
  # GET /company_users.json
  def index
    @company_users = CompanyUser.all
  end

  # GET /company_users/1
  # GET /company_users/1.json
  def show
  end

  # GET /company_users/new
  def new
    @company_user = CompanyUser.new
  end

  # GET /company_users/1/edit
  def edit
  end

  # POST /company_users
  # POST /company_users.json
  def create
    @company_user = CompanyUser.new(company_user_params)

    respond_to do |format|
      if @company_user.save
        format.html { redirect_to @company_user, notice: 'Company user was successfully created.' }
        format.json { render :show, status: :created, location: @company_user }
      else
        format.html { render :new }
        format.json { render json: @company_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_users/1
  # PATCH/PUT /company_users/1.json
  def update
    respond_to do |format|
      if @company_user.update(company_user_params)
        format.html { redirect_to @company_user, notice: 'Company user was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_user }
      else
        format.html { render :edit }
        format.json { render json: @company_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_users/1
  # DELETE /company_users/1.json
  def destroy
    @company_user.destroy
    respond_to do |format|
      format.html { redirect_to company_users_url, notice: 'Company user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def search_user
    user = User.find_by(email: params[:email])
    if user
      data = {user: user, message: "User found"}
    else
      data = {user: nil, message: "User not found"}
    end
    render json: data
  end
  def invite

    user = User.find(params[:value].to_i) if params[:type] == "id"
    invitation  = Invitation.new
    if user
      invitation.email = user.email
      invitation.user_id = user.id 
      invitation.poc = params[:poc]
      invitation.purpose = params[:purpose]  
    else
      invitation.email = params[:value]
    end
    invitation.save
    render json: {}
  end

  def scan
    invitation = Invitation.where(code: params[:code], active: nil).first
    if invitation 
      invitation.active = false
      invitation.save
      user = invitation.user
      Visitor.create(name: user.name, email: user.email, purpose: invitation.purpose, poc: invitation.poc)
      status_text = "success"
    else
      status_text=  "failure"
    end
    render json: {status: 200, status_text: status_text}
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_user
      @company_user = CompanyUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_user_params
      params.require(:company_user).permit(:name, :email, :phone_number)
    end
end
