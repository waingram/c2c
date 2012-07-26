class ItemsController < ApplicationController

  before_filter :load_package

  # GET /items
  # GET /items.json
  def index
    @items = @package.items
    render :json => @items.collect { |i| i.to_jq_upload }.to_json
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = @package.items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = @package.items.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = @package.items.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    p_attr = params[:item]
    p_attr[:file] = params[:item][:file].first if params[:item][:file].class == Array

    @item = @package.items.new(p_attr)

    if @item.save
      respond_to do |format|
        format.html {
          render :json => [@item.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@item.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = @package.items.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @package, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = @package.items.find(params[:id])
    @item.destroy
    render :json => true
    #respond_to do |format|
    #  format.html { redirect_to @package }
    #  format.json { head :no_content }
    #end
  end

  private
  def load_package
    @package = Package.find(params[:package_id])
  end
end
