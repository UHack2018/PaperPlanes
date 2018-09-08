class Folder < ApplicationRecord
	acts_as_tree
	

	has_many :holdings , :dependent => :destroy
end
