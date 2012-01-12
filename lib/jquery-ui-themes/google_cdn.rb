require 'httparty'
require 'fileutils'
require 'iconv'

module JqueryUiThemes

  class GoogleCDN
    include HTTParty
    base_uri 'http://ajax.googleapis.com/ajax/libs/jqueryui/'
    
    class << self
    
      def download(theme, version)
        version ||= JqueryUiThemes::JQUERYUI_VERSION
        
        css = get("/#{version}/themes/#{theme}/jquery-ui.css")
        
        if css.success?          
          FileUtils.mkdir_p(File.expand_path("./app/assets/stylesheets/jquery-ui/#{version}/"))
          FileUtils.mkdir_p(File.expand_path("./app/assets/images/jquery-ui/#{version}/#{theme}/"))
          
          # Store the css file
          File.open(File.expand_path("./app/assets/stylesheets/jquery-ui/#{version}/#{theme}.css.scss"), "w") do |file| 
            file.puts css.gsub(/url\(images\/(.*)\)/, 'url(image-path(\'jquery-ui/' + version + '/' + theme + '/\1\'))')
          end
          
          dest_path = File.expand_path("./app/assets/images/jquery-ui/#{version}/#{theme}/")
          FileUtils.cd(dest_path)

          # Store the images
          css.to_s.scan(/images\/.*\.png|\.gif/).each do |path|
            `wget http://ajax.googleapis.com/ajax/libs/jqueryui/#{version}/themes/#{theme}/#{path}` 
          end
        end
        
        css
      end
      
      def download_all(version)
        version ||= JqueryUiThemes::JQUERYUI_VERSION
        
        themes.each do |theme|
          self.download(theme, version)
        end
      end
      
      private 
      
        def themes
          %w{ui-lightness ui-darkness}
        end
    
    end
  end
end
