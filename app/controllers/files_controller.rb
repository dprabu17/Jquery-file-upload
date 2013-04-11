require 'fileutils'
class FilesController < ApplicationController
  def create
    puts "Create *************"
    p params

  tmp = params["my_file"].tempfile
  p tmp
  p tmp.path
  p params["my_file"].original_filename
  File.open("#{Rails.root}/public/images/site/#{params['my_file'].original_filename}", "wb") { |f| f.write(params["my_file"].read) }
  render :json => {:path => "/images/site/#{params['my_file'].original_filename}"}
   # render layout: false, content_type: "text/html"
  end
end
