class MainController<ApplicationController
  before_action:force_jason, only::search

  def index
  end

  def search
    @items=Item.ransackle(title_cont: params[:q]).result(distinct:true).limit(5)
  end

  private
  def force_jason
    request.format= :json
  end
end
