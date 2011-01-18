module ApplicationHelper

    def logo
      image_tag("logo.png", :alt => "Commercialize logo", :class => "round", :size => "200x70")
    end
    
    def popular_posts
    	@popular_posts = Post.popular.limit_3
    end
    
    def recent_commercials
    	@recent_commercials = Commercial.limit_5
    end
end
