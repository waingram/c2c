class SpreadsheetsController < ApplicationController

  before_filter :load_package

  # GET /spreadsheets
  # GET /spreadsheets.json
  def index
    @spreadsheets = @package.spreadsheets
    render :json => @spreadsheets.collect { |i| i.to_jq_upload(@package.id) }.to_json
  end

  # GET /spreadsheets/1
  # GET /spreadsheets/1.json
  def show
    @spreadsheet = @package.spreadsheets.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spreadsheet }
    end
  end

  # GET /spreadsheets/new
  # GET /spreadsheets/new.json
  def new
    @spreadsheet = @package.spreadsheets.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spreadsheet }
    end
  end

  # GET /spreadsheets/1/edit
  def edit
    @spreadsheet = @package.spreadsheets.find(params[:id])
  end

  # POST /spreadsheets
  # POST /spreadsheets.json
  def create
    p_attr = params[:spreadsheet]
    p_attr[:manifest] = params[:spreadsheet][:manifest].first if params[:spreadsheet][:manifest].class == Array

    @spreadsheet = @package.spreadsheets.new(p_attr)

    if @spreadsheet.save
      respond_to do |format|
        format.html {
          render :json => [@spreadsheet.to_jq_upload(@package.id)].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@spreadsheet.to_jq_upload(@package.id)].to_json
        }
      end
    else
      if @spreadsheet.manifest_integrity_error
        render :json => [{:error => @spreadsheet.manifest_integrity_error}], :status => 415
      else
        render :json => [{:error => @spreadsheet.errors}], :status => 422
      end
    end
  end

  # PUT /spreadsheets/1
  # PUT /spreadsheets/1.json
  def update
    @spreadsheet = @package.spreadsheets.find(params[:id])

    respond_to do |format|
      if @spreadsheet.update_attributes(params[:spreadsheet])
        format.html { redirect_to @package, notice: 'Spreadsheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @spreadsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spreadsheets/1
  # DELETE /spreadsheets/1.json
  def destroy
    @spreadsheet = @package.spreadsheets.find(params[:id])
    @spreadsheet.destroy
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
