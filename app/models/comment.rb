class Comment < ApplicationRecord
	belongs_to :post
	has_many :sub_comment, dependent: :delete_all
    validates :content, presence: true, length:{minimum:2}
    validates :user, presence: true, length:{minimum:2}
    validates :post_id, presence: true, numericality:{only_integer:true}
end
