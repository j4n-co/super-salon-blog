#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'

require 'tumblargh'

Tumblargh::API::set_api_key '2DHicxoSBUJlQdVxXtQxW3zB3f0UIPlVUBbYMbtmdF1r4ziJpS'

map "/" do

  app = proc do |env|
    html = Tumblargh::render_file('my_theme.html', 'willw.tumblr.com')

    [200, { "Content-Type" => "text/html" }, html.lines]
  end

  run app
end