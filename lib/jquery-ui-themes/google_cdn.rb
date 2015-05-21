require 'httparty'
require 'fileutils'

module JqueryUiThemes

  class GoogleCDN
    include HTTParty
    base_uri '//ajax.googleapis.com/ajax/libs/jqueryui/'

    class << self
    
      def download(theme, version)
        version ||= JqueryUiThemes::JQUERYUI_VERSION

        initial_path = FileUtils.pwd
        
        path = "/#{version}/themes/#{theme}/jquery-ui.css"

        css = get(path)
        
        if css.success?          
          FileUtils.mkdir_p(File.expand_path("./app/assets/stylesheets/jquery-ui/#{version}/"))
          FileUtils.mkdir_p(File.expand_path("./app/assets/images/jquery-ui/#{version}/#{theme}/"))
          
          # Store the css file
          File.open(File.expand_path("./app/assets/stylesheets/jquery-ui/#{version}/#{theme}.css.scss"), "w") do |file| 
            content = css.gsub(/0pxdow=0px/, '0px') # Weird Google CDN bug
            content = content.gsub(/url\(images\/(.*)(\.png|.gif\))/, 'url(image-path(\'jquery-ui/' + version + '/' + theme + '/\1\2\')')
            file.puts(content)
          end
          
          dest_path = File.expand_path("./app/assets/images/jquery-ui/#{version}/#{theme}/")
          
          FileUtils.cd(dest_path)

          # Store the images
          css.to_s.scan(/images\/.*\.png|\.gif/).each do |path|
            check_path = File.expand_path("./#{path.split('/')[1]}")

            unless File.exists?(File.expand_path(check_path))
              `wget //ajax.googleapis.com/ajax/libs/jqueryui/#{version}/themes/#{theme}/#{path}`
            end
          end

          FileUtils.cd(initial_path)
        else
          puts "Failed to download the css: #{path}"
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
          %w{black-tie blitzer cupertino dark-hive dot-luv eggplant excite-bike flick hot-sneaks humanity le-frog mint-choc overcast pepper-grinder redmond smoothness south-street start sunny swanky-purse trontastic ui-darkness ui-lightness vader}
        end
    
    end
  end
end 