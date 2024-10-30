# app/interactors/posts/update_post.rb
module Posts
    class UpdatePost
      include Interactor
  
      def call
        post = Post.find(context.post_id)
  
        if post.update(context.post_params)
          context.post = post
        else
          context.fail!(error: post.errors.full_messages.to_sentence)
        end
      end
    end
end
  