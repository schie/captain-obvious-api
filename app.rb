require 'bundler'
Bundler.require

file_names = Dir.entries('public')[2..-1]
base_names = file_names.map { |name| File.basename(name, File.extname(name)) }

get '/', '/help' do
  json base_names.map { |name| { route: "#{request.base_url}/#{name}", path: "/#{name}", action: name.tr('_', ' ') } }
end

get '/:action' do
  file_name = file_names.select { |file| file =~ /#{params[:action]}/}
  send_file File.join(settings.public_folder, file_name)
end
