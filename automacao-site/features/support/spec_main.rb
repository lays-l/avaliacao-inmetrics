Dir[File.join(File.dirname(__FILE__), 'spec_helper/*.rb')].sort.each { |file| require file }

$site_pages = Site::Pages.new

World(SiteCommons)

SitePrism::Page.class_eval do
  include SiteCommons
end

SitePrism::Section.class_eval do
  include SiteCommons
end