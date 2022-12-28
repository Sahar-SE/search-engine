class UsersController < ApplicationController
  include SetCurrentVisitor
  def sign_in
        @user = User.find_by!(email: params[:email])
        Current.visitor.presence && Current.visitor.update!(user: @user)
    
        redirect_to root_path
      end
    
      def sign_up
        @user = User.create!(user_params)
        Current.visitor.presence && Current.visitor.update!(user: @user)
    
        redirect_to root_path
      end    

      private

      def user_params
          params.permit(:username, :email, :password)
      end
end
