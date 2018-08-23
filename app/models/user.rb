class User < ApplicationRecord

  has_many :addresses, :dependent => :destroy
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true


	def self.search_user(query)
    where("LOWER(first_name) like ?", '%' + query.downcase )
  end
end
