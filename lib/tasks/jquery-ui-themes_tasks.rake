namespace :jquery_ui_themes do
  namespace :import do
    desc 'Import jQuery themeroller theme'
    task :themeroller, [:path, :name] => :environment do |t, args|
      abort 'Please specify a path to the file to import' if args[:path].blank?
      abort 'Please specify a name' if args[:name].blank?
      abort ('Import file not found!') unless File.exist?(File.expand_path(args[:path]))
      
      require 'fileutils'
      
      FileUtils.mkdir_p(File.expand_path("./vendor/assets/stylesheets/jquery-ui/#{args[:name]}"))
      FileUtils.mkdir_p(File.expand_path("./vendor/assets/stylesheets/jquery-ui/#{args[:name]}/images"))
      
      css = File.read(File.expand_path(args[:path]))
      
      File.open(File.expand_path("./vendor/assets/stylesheets/jquery-ui/#{args[:name]}/theme.css.scss"), "w") do |file|
        file.puts css.gsub(/url\(['"]?images\/([^'"]+)['"]?\)/, 'url(image-path("jquery-ui/' + args[:name] + '/images/\1"))')
      end

      FileUtils.cp_r(File.dirname(File.expand_path(args[:path])) + '/images/.', File.expand_path("./vendor/assets/stylesheets/jquery-ui/#{args[:name]}/images/"))
    end
    
    desc 'Import themes from Google CDN'
    task :google_cdn, [:version, :theme] => :environment do |t, args|
      abort 'Please specify a version to import' if args[:version].blank?
      abort 'Please specify a theme to import' if args[:theme].blank?

      if args[:theme] == 'all'
        JqueryUiThemes::GoogleCDN.download_all(args[:version])
      else
        JqueryUiThemes::GoogleCDN.download(args[:theme], args[:version])
      end
    end
  end
end
