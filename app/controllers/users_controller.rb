class UsersController < Clearance::UsersController


  def show
  end

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.first_name = first_name
      user.last_name = last_name
    end
  end

  def edit
  end

  def update

    current_user.remove_image! if params[:user][:remove_image] == "1"
    respond_to do |format|
      if current_user.update(user_profile_params)
        format.html { redirect_to user_path, notice: 'profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to my_listings_path, notice: 'listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private



  def user_profile_params
    params.require(:user).permit(:first_name, :last_name, :image)
  end

end
