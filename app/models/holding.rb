class Holding < ApplicationRecord

	belongs_to :user
	 has_attached_file :uploaded_file, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	 validates_attachment_content_type :uploaded_file, content_type: /\Aimage\/.*\z/,
	 									:url => "holgins/get/:id",
	 									:path => ":Rails_root/holdings/:id/:basename.:extension"


	 def file_name
	 	uploaded_file_file_name
	 end


	def file_size 
    	uploaded_file_file_size 
	end
end
