ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './models/link.rb'
require_relative './models/tag.rb'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/links' do
    #link1 = Link.create(title:(params[:title]),url:(params[:url]))
    @links = Link.all
    erb :links
  end

  post '/links' do
    @link = Link.create(title: params[:title],url: params[:url])
    split_tags = params[:tags].split(',')
    split_tags.each do |item| @link.tags << (Tag.first_or_create(name: item))
    end
    @link.save
    # tag = Tag.first_or_create(name: params[:tags])
    # @link.tags << tag # this is adding the new tag to the new link's DataMapper collection
    redirect '/links'
  end

  get '/links/new' do
    erb :creating_links
  end

  get '/tags/:name' do
    tag = Tag.first_or_create(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

   #now send it a tag method which only displays the tag?


  run! if app_file == $0
end
