module ApplicationHelper

    def logo
      image_tag("logo.png", :alt => "Commercial.ize logo", :class => "round")
    end
    
    def popular_posts
    	@popular_posts = Post.popular.limit_5
    end
end
