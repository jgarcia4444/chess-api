
def login
    puts "login route triggered"
    if params[:login_info]
    else
        render :json => {
            success: false,
            error: {
                message: ""
            }
        }
    end
end