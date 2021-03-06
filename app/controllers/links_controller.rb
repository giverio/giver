class LinksController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_org
  before_action :set_link, only: [:destroy] 

  layout 'org'

  def new
    @link = @org.links.new
  end

  def create 
    @link = @org.links.new(link_params)
    respond_to do |format|
      if @link.save
        format.html { redirect_to @org, notice: 'Link was successfully created.' }
      else
        format.html { render action: 'new', notice: "Error: #{@link.errors.full_messages.to_sentence}" }
      end
    end
  end

  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to @org }
    end
  end

private

  def set_link
    @link = @org.links.find(params[:id]) || not_found
  end

  def set_org
    @org = Org.find_by_slug(params[:org_id]) || not_found
  end

  def link_params
    params.require(:link).permit(:location, :name, :brand)
  end

end
