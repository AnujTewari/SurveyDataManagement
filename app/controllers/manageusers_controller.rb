class ManageusersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    # default: render ’new’ template
  end

  def create  

    @user = User.new(params[:user])
    if @user.save 
      flash[:notice] = "#{@user.email} was successfully created."
      if params[:user][:admin] == "Admin" 
        @user.make_admin
      else
        @user.make_user
      end
      @user.save
      redirect_to manageusers_path
    else
     flash[:notice] = "Error: #{@user.errors.full_messages}"
     render 'new'
    end  
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes!(params[:user])
      flash[:notice] = "Update Successful"
      if params[:user][:admin] == "Admin" 
        @user.make_admin
      else
        @user.make_user
      end
      @user.save
    else
      flash[:warning] = "Update Failed"
    end
    redirect_to manageusers_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User ’#{@user.email}’ deleted."
    redirect_to manageusers_path
  end

end
