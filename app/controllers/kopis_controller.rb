class KopisController < ApplicationController

    before_action :authenticate_user!, :except => [ :index ]

    def index
        # # test to see if we are at /parks/:id/rangers or /rangers
        # if params.has_key?(:origin_id)
        #   # get all the rangers for a specific park
        #   @kopis = Kopi.where(origin_id: params[:origin_id] )
        # else
        #   # get all rangers
          @kopis = Kopi.all
        #   @origins = Origin.all
        
        
      end

    def new
      @origins = Origin.all

      @roasts = Roast.all
    end

    def edit
        @kopi = Kopi.find(params[:id])
        @roasts = Roast.all
    end
  
    def create
      @kopi = Kopi.new(kopi_params)
      
      @kopi.user = current_user

      if @kopi.save
    #   render plain: params[:kopi].inspect
      redirect_to @kopi
      else
        render 'new'
    end
end

  
    def show
      @kopi = Kopi.find(params[:id])

    end

    def update
        @kopi = Kopi.find(params[:id])

        @kopi.update(kopi_params)
        redirect_to @kopi
    end

    def destroy
        @kopi = Kopi.find(params[:id])
        @kopi.destroy
  
        redirect_to root_path
    end
  
  
  private
  
    def kopi_params
      params.require(:kopi).permit(:name, :origin_id, :roast_id)
    end
  end