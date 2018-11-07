module Counter
    private
    def counter
        if session[:counter].nil?
         session[:counter] = 0
         @counter = session[:counter]
        else
         session[:counter] += 1
         @counter = session[:counter]
        end
    end

    def reset_counter
        session[:counter] = 0
        @counter = session[:counter]
    end
end