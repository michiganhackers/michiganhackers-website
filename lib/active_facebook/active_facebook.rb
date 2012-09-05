module ActiveFacebook
  
  CONFIG = YAML.load_file(Rails.root.join("config/facebook.yml"))[Rails.env]
  APP_ID = CONFIG[:app_id.to_s]
  SECRET_KEY = CONFIG[:secret_key.to_s]
  ROOT_OBJ = CONFIG[:root_obj.to_s]
  
  def self.graph_instance
    @graph_instance ||= Koala::Facebook::API.new oauth_instance.get_app_access_token    
  end
  
  def self.oauth_instance
    @oauth_instance ||= Koala::Facebook::OAuth.new APP_ID, SECRET_KEY
  end
  
  class Base
    class << self
      
      protected
      
      def graph_instance
        ActiveFacebook::graph_instance
      end
      
      def oauth_instance
        ActiveFacebook::oauth_instance
      end
      
    end

  end  
end
