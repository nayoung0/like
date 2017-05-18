class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    # like 와의 관계 설정
end
