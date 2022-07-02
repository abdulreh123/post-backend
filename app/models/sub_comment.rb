class SubComment < ApplicationRecord
    validates :content, presence: true,length:{minimum:2}
    validates :user, presence: true,length:{minimum:2}
    validates :comment_id, presence: true, numericality:{only_integer:true}
end
