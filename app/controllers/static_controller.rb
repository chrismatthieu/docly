class StaticController < ApplicationController
  def index
    @page = Page.new
    @pages = Page.where('pagesecured != true')
  end
end
