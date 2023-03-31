
class GoogleAuthController < ApplicationController
    def authenticate_social_auth_user
        puts "Authenticate Social Auth User triggered!"
        user = User.signin_or_create_from_provider(params)
        if user.persisted?
            sign_in(user)
            login_token = user.create_new_auth_token
            render :json => {
                success: true,
                headers: login_token,
                user_info: {
                    id: user.uid,
                    email: user.email,
                },
                status: :created
            }
        else
            render :json => {
                success: false,
                error: {
                    message: "There was a problem signing you in through #{params[:provider]}",
                    errors: user.errors.full_messages
                }
            },
            status: :unprocessable_entity
        end
    end
end