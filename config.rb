###
# Blog settings
###

# Time.zone = "UTC"

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = "blog"
  blog.permalink = "{title}.html"
  blog.layout = "blog"

  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"
  # blog.tag_template = "tag.html"
  # blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

# Configure RSS
page "/feed.xml", layout: false

# Markdown configs
set :markdown_engine, :redcarpet

set :markdown,
  no_intra_emphasis: true, # Do not parse emphasis inside of words (eg: "foo_bar_baz")
  fenced_code_blocks: true, # Parse fenced code blocks
  strikethrough: true, # Parse strikethrough (eg: "this is ~~good~~ bad")
  space_after_headers: true, # A space is required between the hash at the beginning of a header
  smartypants: true # Use smart typograhic punctuation for things like quotes and dashes

# Enable syntax highlighting
activate :syntax

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.host = 'madebyform.com'
  deploy.path = '/home/madebyform/site/new'
  deploy.user = 'madebyform'
  deploy.build_before = true
  deploy.flags = "-avz --chmod=Du=rwx,go=rx,Fu=rwx,go=rx"
end

# Since we're deploying to /new/ use relative links
set :relative_links, true

# Build-specific configuration
configure :build do
  # Pretty URLs
  activate :directory_indexes

  # Improving cacheability by generating uniquely-named assets
  activate :asset_hash

  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Use relative URLs
  activate :relative_assets
end
