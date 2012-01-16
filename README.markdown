jQuery UI themes for Rails
==========================

All the pre rolled themes for jQuery UI packaged into a gem.

Usage
-----

In your stylesheet manifest include the following

`*= require jquery-ui/<theme name>`

where theme name can be one of the following:

* black-tie
* blitzer
* cupertino
* dark-hive
* dot-luv
* eggplant
* excite-bike
* flick
* hot-sneaks
* humanity
* le-frog
* mint-choc
* overcast
* pepper-grinder
* redmond
* smoothness
* south-street
* start
* sunny
* swanky-purse
* trontastic
* ui-darkness
* ui-lightness
* vader

Helper
------

If you want to take advantage of the Google CDN a helper is included that takes the theme name and optional version (latest used if version is not specified)

Example:

`stylesheet_link_tag jqueryui_css_google_cdn('mint-choc', '1.7.2')`

Rake Tasks
----------

Includes a rake task which updates the themeroller created file with image-path and moves the new file and images into the asset folder (stylesheets/jquery-ui and images/jquery-ui respectively).

Example:

`rake jquery_ui_themes:import:themeroller[jquery-ui-1.8.16.custom/css/hot-sneaks/jquery-ui-1.8.16.custom.css,hot-sneaks]`

Also includes a rake task to import the files for a specific version and theme from Google CDN

Example 

`rake jquery_ui_themes:import:google_cdn[1.8.17,ui-lightness]`

Optionally you can pass 'all' instead of a specific theme and all the current themeroller themes for that version will be imported into the assets folder.

Current theme version
---------------------

The current versions of the themes are for **1.8.16** of [jQuery UI](http://jqueryui.com/ "jQuery UI"). The plan is to sync with the version in use by the jquery-rails gem, but should it be required the included rake tasks make supporting older or custom themes trivial.

Requirements
------------

Requires Rails 3.1 and higher, or anything that uses the asset pipeline.
