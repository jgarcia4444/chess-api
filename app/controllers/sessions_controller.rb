

def login
    if params[:login_info]
        login_info = params[:login_info]
        if login_info[:email]
            email = login_info[:email]
            user = User.find_by(email:  "#{email}.com")
            if user 
                if login_info[:password]
                    password = login_info[:password]
                    if user.authenticate(password)
                        render :json => {
                            success: true,
                            user_info: {
                                id: user.id,
                                username: user.username,
                                email: user.email,
                            }
                        }
                    else
                        render :json => {
                            success: false,
                            error: {
                                message: "",
                                errors: [{type: "PASSWORD", message: "Incorrect password"}]
                            }
                        }
                    end
                else
                    render :json => {
                        success: false,
                        error: {
                            message: "Information sent improperly.",
                            errors: [{type: "PASSWORD", message: "Password is required to login."}]
                        }
                    }
                end
            else
                render :json => {
                    success: false,
                    error: {
                        message: "",
                        errors: [{type: "EMAIL", message: "A user was not found with the given email."}]
                    }
                }
            end
        else
            render :json => {
                success: false,
                error: {
                    message: "Information was sent improperly",
                    errors: [{type: "EMAIL", message: "An email is required to login"}],
                }
            }
        end
    else
        render :json => {
            success: false,
            error: {
                message: "Information was sent improperly",
                errors: []
            }
        }
    end

end