class UsersController < ApplicationController
  include SetCurrentVisitor
  def sign_in
        user = User.find_by!(email: params[:email])
        if user&.authenticate(params[:password])
         set_current_user(user)
         Current.visitor.presence && Current.visitor.update!(user: user)
        redirect_to root_path
      end
    end

    def set_current_user(user)
      session[:user_id] = user.id
    end

      def sign_up
        user = User.create!(user_params)
        set_current_user(user)
        Current.visitor.presence && Current.visitor.update!(user: user)
        redirect_to root_path
      end    

      def sign_out
        session[:user_id] = nil
        redirect_to root_path
      end

      def clear_device_history
        Current.visitor.searches.destroy_all
      end
      
      def clear_user_history
        Current.visitor.presence && Current.visitor.update!(user: nil)
        redirect_to root_path
      end

      def delete_account
        current_user.destroy
        session[:user_id] = nil
        Current.visitor.update!(user: nil)
        redirect_to root_path
      end
      private

      def user_params
          params.permit(:username, :email, :password)
      end
end
