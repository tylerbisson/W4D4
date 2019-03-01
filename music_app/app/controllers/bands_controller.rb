class BandsController < ApplicationController 
    def new 
        render :new
    end

    def create 
        # debugger 
        @band = Band.new(band_params)
        if @band.save! 
            redirect_to bands_url(@band)
        else
            render :new
        end
    end

    def index 
        render :index
    end

    def show    
        @band = Band.find(params[:id])
        # debugger
        render :show 
    end

    def destroy 
        @band = Band.find(params[:id])
        
    end

    private 

    def band_params 
        params.require(:band).permit(:name)
    end
end