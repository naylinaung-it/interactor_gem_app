# app/interactors/posts/create_post.rb
module Posts
    class CreatePost
      include Interactor
  
      def call
        user = User.find(context.user_id)
        post = user.posts.build(context.post_params)
  
        if post.save
          context.post = post
        else
          context.fail!(post: post)
        end
      end
    end
  end
  