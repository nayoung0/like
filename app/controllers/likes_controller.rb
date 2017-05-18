class LikesController < ApplicationController
    before_action :authenticate_user!
    
    # 좋아요가 눌러진 상태(빨간 하트)라면 좋아요를 취소(빈 하트로 변경)할수 있게
    # 좋아요가 안 눌러진 상태(빈 하트)라면 좋아요를 누를 수 있게(빨강 하트로 변경) 
    def like_toggle
        like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
        
        if like.nil?
            Like.create(user_id: current_user.id, post_id: params[:post_id])
        else
            like.destroy
        end
        
        redirect_to :back
    end
end



