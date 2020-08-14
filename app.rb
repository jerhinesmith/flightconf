# frozen_string_literal: true

require 'sinatra'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end
