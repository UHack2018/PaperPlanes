class HomeController < ApplicationController
  def index
  	if user_signed_in?
     	@folders = current_user.folders.order("name desc")
		@holdings = current_user.holdings.order("uploaded_file_file_name desc ") 
  	end
  end
end
