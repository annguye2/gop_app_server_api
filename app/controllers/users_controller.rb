class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_token, except: [:login, :create]
  before_action :authorize_user, except: [:login, :create, :index]


  # def login
  #     user = User.find_by(username: params[:user][:username])
  #     if user && user.authenticate(params[:user][:password])
  #       render json: {status: 200, user: user}
  #     else
  #       render json: {status: 401, message: "Unauthorized"}
  #     end
  # end
  # User/ login
  def login
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      projects = Project.where(user_id: user.id) # worked
      projects = user.projects.all  # get all projects from this userthis also worked
      token = create_token(user.id, user.username)
      render json: {status: 200, token: token, user: user, projects: projects,  message:"sucessful login"}
      #render json: {status: 200, user: user}
    else
      render json: {status: 401, message: "Unauthorized"}
    end
  end
  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # # GET /users/1
  # def show
  #   render json: @user
  # end
  # GET /users/1
  def show

    projects = @user.projects.all
    render json: { user: @user, projects: projects, message: "successful"}
    puts 'Get user informaion'
    # render json: get_current_user
  end
  # # POST /users
  # def create
  #   @user = User.new(user_params)
  #
  #   if @user.save
  #     render json: @user, status: :created, location: @user
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end
  # POST /users
    def create
      createdUser = User.find_by_username(params[:username])
      if !createdUser
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created, location: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      else
        render json: {status: 204, message: "username is already taken"}
      end
    end
  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:username, :password, :password_digest, :project_id, :email, :name)
  end

  #create token
  def create_token(id, username)
    JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
  end

  #payload
  def payload(id, username)
    {
      exp: (Time.now + 30.minutes).to_i,
      iat: Time.now.to_i,
      iss: ENV['JWT_ISSUER'],
      user: {
        id: id,
        username: username
      }
    }
  end

end # end of file
