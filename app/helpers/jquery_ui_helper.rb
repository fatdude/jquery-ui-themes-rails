module JqueryUiHelper
  def jqueryui_css_google_cdn(theme, version = nil)
    version = JqueryUiThemes::JQUERYUI_VERSION unless version
    "//ajax.googleapis.com/ajax/libs/jqueryui/#{version}/themes/#{theme}/jquery-ui.css"
  end
end
