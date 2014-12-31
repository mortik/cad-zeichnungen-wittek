Encoding.default_external = 'utf-8'

activate :livereload
activate :directory_indexes
activate :syntax

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :haml, { :ugly => true, :format => :html5 }
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true,
               :autolink => true,
               :smartypants => true

sprockets.append_path File.join "#{root}", "bower_components"

activate :deploy do |deploy|
  deploy.user     = "cad-zeichnungen-wittek"
  deploy.build_before = true
  deploy.method = :rsync
  deploy.host   = "cad-zeichnungen-wittek.de"
  deploy.path   = "~/current"
end

configure :build do
  activate :minify_css
  activate :minify_javascript

  activate :asset_hash
  activate :relative_assets
end
