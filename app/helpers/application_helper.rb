module ApplicationHelper

    def logo
      image_tag("logo.png", :alt => "Commercial.ize logo", :class => "round")
    end
    
    def popular_posts
    	@popular_posts = Post.popular.limit_5
    end
    
    def recent_commercials
    	@recent_commercials = Commercial.limit_5
    end
end
