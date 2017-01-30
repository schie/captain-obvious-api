require 'bundler'
Bundler.require


get '/', '/help' do
  json Dir.entries('public')[2..-1].map { |name| { route: "/#{name[0..-5]}", filename: name, action: name[0..-5].tr('_', ' ') } }
end

get '/:action' do
  send_file File.join(settings.public_folder, "#{params[:action]}.gif")
end
