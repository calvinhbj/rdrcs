class MyRegistrationsController < Devise::RegistrationsController

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    build_resource(sign_up_params)

    if resource.save
      #设置默认 会员角色权限
      resource.add_role :r_member , resource
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end
  
  def add
    build_resource(sign_up_params)

    if resource.save
      roles = params.require(:roles)
      roles.each{|rolename| 
            resource.add_role rolename , resource
      }
      if resource.save
        respond_with resource , :location => users_url , :notice => "add success"
        #format.html { redirect_to users_url , notice: 'User was successfully updated.' }
        #format.json { head :no_content }
      else
        respond_with resource , :location => users_url
      end
    else
        respond_with resource , :location => users_url
    end
  end


  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
  def update
    super
  end
 
end
