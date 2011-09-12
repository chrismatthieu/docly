class StaticController < ApplicationController
  def index
    @page = Page.new
    # @pages = Page.where('pagesecured != true').order("created_at desc")
    @pages = Page.paginate :page => params[:page], :per_page => 10, :order => 'created_at DESC', :conditions => ['pagesecured != true']
    
  end
  
  def authenticate
    page = Page.find_by_pagename(params[:pages][:pagename])
    if page && page.authenticate(params[:pages][:password])
      session[:page_id] = page.id
      redirect_to "/" + params[:pages][:pagename], :notice => "Logged in"
    else
      redirect_to "/password/" + params[:pages][:pagename], :notice => 'Invalid password.'
    end
  end
end
