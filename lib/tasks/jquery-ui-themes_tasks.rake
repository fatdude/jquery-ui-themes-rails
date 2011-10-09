# desc "Explaining what the task does"
# task :jquery-ui-themes do
#   # Task goes here
# end

desc "Import the themes into the project"
task :import do
  require 'rubygems'
  require 'httparty'
  
  class Downloader
    include HTTParty
  end
  
  puts Downloader.post('http://jqueryui.com/download/', 'ffDefault=Segoe+UI%2C+Helvetica%2C+Arial%2C+sans-serif&fwDefault=bold&fsDefault=1.1em&cornerRadius=4px&bgColorHeader=453326&bgTextureHeader=12_gloss_wave.png&bgImgOpacityHeader=25&borderColorHeader=695649&fcHeader=e3ddc9&iconColorHeader=e3ddc9&bgColorContent=201913&bgTextureContent=05_inset_soft.png&bgImgOpacityContent=10&borderColorContent=9c947c&fcContent=ffffff&iconColorContent=222222&bgColorDefault=1c160d&bgTextureDefault=12_gloss_wave.png&bgImgOpacityDefault=20&borderColorDefault=695444&fcDefault=9bcc60&iconColorDefault=9bcc60&bgColorHover=44372c&bgTextureHover=12_gloss_wave.png&bgImgOpacityHover=30&borderColorHover=9c947c&fcHover=baec7e&iconColorHover=add978&bgColorActive=201913&bgTextureActive=03_highlight_soft.png&bgImgOpacityActive=20&borderColorActive=9c947c&fcActive=e3ddc9&iconColorActive=e3ddc9&bgColorHighlight=619226&bgTextureHighlight=03_highlight_soft.png&bgImgOpacityHighlight=20&borderColorHighlight=add978&fcHighlight=ffffff&iconColorHighlight=ffffff&bgColorError=5f391b&bgTextureError=02_glass.png&bgImgOpacityError=15&borderColorError=5f391b&fcError=ffffff&iconColorError=f1fd86&bgColorOverlay=aaaaaa&bgTextureOverlay=01_flat.png&bgImgOpacityOverlay=0&opacityOverlay=30&bgColorShadow=aaaaaa&bgTextureShadow=01_flat.png&bgImgOpacityShadow=0&opacityShadow=30&thicknessShadow=8px&offsetTopShadow=-8px&offsetLeftShadow=-8px&cornerRadiusShadow=8px').inspect
  
  
  
end
