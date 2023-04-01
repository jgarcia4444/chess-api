
class UsersController < ApplicationController
    def update_username
        if params[:id]
            id = params[:id]
            if params[:updated_username]
                updated_username = params[:updated_username]
                user = User.find_by(uid: id)
                if user 
                    user.update(username: updated_username)
                    if user.username == updated_username
                        render :json => {
                            success: true,
                            username: updated_username
                        }
                    else
                        render :json => {
                            success: false,
                            error: {
                                message: "There was an error updating the username.",
                                errors: user.errors.full_messages
                            }
                        }
                    end
                else
                    render :json => {
                        success: false,
                        error: {
                            message: "No user was found with the given information.",
                            errors: []
                        }
                    }
                end
            else
                render :json => {
                    success: false,
                    error: {
                        message: "User information was formatted incorrectly.",
                        errors: []
                    }
                }
            end
        else
            render :json => {
                success: false,
                error: {
                    message: "User information was formatted incorrectly.",
                    errors: []
                }
            }
        end
    end

    def create
        if params[:user_info]
            created_user = User.create(user_params)
            if created_user.valid?
                render :json => {
                    success: true,
                    user_info: {
                        id: created_user.id,
                        username: created_user.username,
                        email: created_user.email,
                    }
                }
            else
                render :json => {
                    success: false,
                    error: {
                        message: "There was an error while creating your user record",
                        user_errors: created_user.errors.full_messages
                    }
                }
            end
        else
            render :json => {
                success: false,
                error: {
                    message: "New user information was sent improperly."
                }
            }
        end
    end

    def welcome
        render :json => {
            message: "Welcome to the react chess api!"
        }
    end

    private
        def user_params
            params.require(:user_info).permit(:email, :username, :password)
        end
end