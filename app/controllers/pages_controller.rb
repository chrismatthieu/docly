class PagesController < ApplicationController
  
  can_edit_on_the_spot_in_tree
  
  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    if params[:pagename] or params[:pages][:pagename]
      @page = Page.find_by_pagename(params[:pagename])
    else
      @page = Page.find(params[:id])
    end
    if @page
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @page }
      end
    else
      respond_to do |format|
        format.html { redirect_to "/", :notice => 'Page was not found.'}
        format.json { render json: @page }
      end
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    @pagelookup = Page.find_by_pagename(params[:page][:pagename])
    if @pagelookup
      redirect_to "/" + params[:page][:pagename]
      return
    end
    
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to "/" + @page.pagename, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])
    # params[:page][:pagebody] = nl2br(params[:value])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :ok }
    end
  end
  
end
