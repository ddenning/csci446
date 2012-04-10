class Member::UsersController < Member::MemberController

  filter_access_to :all

  # GET /users/1
  # GET /users/1.json
  def show
    @user = current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to member_root_url, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        flash[:error] = "Could not save profile"
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end