# Specific layout configuration
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Blog configuration
activate :blog do |blog|
  blog.prefix = "blog"
  blog.permalink = "{title}.html"
  blog.layout = "blog"
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end

# Markdown config
set :markdown_engine, :redcarpet
set :markdown,
  no_intra_emphasis: true,    # Do not parse emphasis inside of words (eg: "foo_bar_baz")
  fenced_code_blocks: true,   # Parse fenced code blocks
  strikethrough: true,        # Parse strikethrough (eg: "this is ~~good~~ bad")
  space_after_headers: true,  # A space is required between the hash at the beginning of a header
  smartypants: true           # Use smart typograhic punctuation for things like quotes and dashes

# Enable syntax highlighting
activate :syntax

# Environment configuration
configure :development do
  activate :livereload
end

configure :build do
  activate :directory_indexes
  activate :asset_hash
  activate :minify_css
  activate :minify_javascript

  # TODO: these should probably be removed once this is in production
  set :relative_links, true
  activate :relative_assets
end


# Site deployment configuration
activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.host = 'madebyform.com'
  deploy.path = '/home/madebyform/site/new'
  deploy.user = 'madebyform'
  deploy.build_before = true
  deploy.flags = "-avz --chmod=Du=rwx,go=rx,Fu=rwx,go=rx"
end
