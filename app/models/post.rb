class Post < ApplicationRecord
	has_many :comment, dependent: :delete_all
	validates :title, presence: true, length:{minimum:2}
    validates :content, presence: true,length:{minimum:2}
    validates :user, presence: true,length:{minimum:2}
end
