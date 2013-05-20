###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

require 'tumblargh'

activate :tumblargh,
  api_key: '2DHicxoSBUJlQdVxXtQxW3zB3f0UIPlVUBbYMbtmdF1r4ziJpS', # This is your OAuth consumer key
  blog: 'supersalonwarsaw.tumblr.com'


#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'

require 'tumblargh'

Tumblargh::API::set_api_key '2DHicxoSBUJlQdVxXtQxW3zB3f0UIPlVUBbYMbtmdF1r4ziJpS'

map "/" do

  app = proc do |env|
    html = Tumblargh::render_file('my_theme.html', 'supersalonwarsaw.tumblr.com')

    [200, { "Content-Type" => "text/html" }, html.lines]
  end

  run app
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end