require 'js-montreal'

Awestruct::Extensions::Pipeline.new do
  helper Awestruct::Extensions::GoogleAnalytics  
  helper Awestruct::Extensions::Partial
  helper JsMtl::Helpers  
  extension JsMtl::Meetups.new
end

