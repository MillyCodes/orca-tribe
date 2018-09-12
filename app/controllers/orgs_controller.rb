class OrgsController < ApplicationController
  # before_action :authenticate_user!

  # list method shows all orgs
  def index
    # @orgs = Org.all

  @search = Sunspot.search(Org) do
      fulltext params[:search]
    end
      @orgs = @search.results
  end

  # show method - specific org profile page
  def show
    @org = Org.find(params[:id])
    @current_person = current_user
    @org_opps = @org.opps
  end

  def new
    @org = Org.new
  end

  def create
    @org = Org.create(org_params)
    if @org.save
      redirect_to org_path
    end
  end

  def edit
    @org = Org.find(params[:id])
  end

  def update
    @org = Org.find(params[:id])

    if @org.update_attributes(org_params)
      redirect_to :action => 'show', :id => @org
    else
      render :action => 'edit'
    end
  end

  def destroy
    @org = Org.find(params[:id])
    @org.destroy

    respond_to do |format|
      format.html {redirect_to org_path} #delete action in individual org page.
      format.js #delete via an ajax call if we decide to do implement it
    end
  end

  def like
    @org = Org.find(params[:id])
    @org.liked_by current_user
    redirect_back(fallback_location: root_path)

  end

  def unlike
    @org = Org.find(params[:id])
    @org.unliked_by current_user
    redirect_back(fallback_location: root_path)

  end

  private

  def org_params
    params.require(:org).permit(:name, :summary, :address, :website,
                                :thumbnail, :phone)
    #the :created_at, :updated_at and :api_org_id are the other params
  end


end
