class HomeController < ApplicationController
  def index
  	if user_signed_in?
  		@holdings = current_user.holdings.order("uploaded_file_file_name desc")
  	end
  end


  def share     
    #first, we need to separate the emails with the comma 
    email_addresses = params[:email_addresses].split(",") 
      
    email_addresses.each do |email_address| 
      #save the details in the ShareFolder table 
      @shared_folder = current_user.shared_folders.new
      @shared_folder.folder_id = params[:folder_id] 
      @shared_folder.shared_email = email_address 
    
      #getting the shared user id right the owner the email has already signed up with ShareBox 
      #if not, the field "shared_user_id" will be left nil for now. 
      shared_user = User.find_by_email(email_address) 
      @shared_folder.shared_user_id = shared_user.id if shared_user 
    
      @shared_folder.message = params[:message] 
      @shared_folder.save 
    
      #now we need to send email to the Shared User 
    end
  
    #since this action is mainly for ajax (javascript request), we'll respond with js file back (refer to share.js.erb) 
    respond_to do |format| 
      format.js { 
      } 
    end
end
end
