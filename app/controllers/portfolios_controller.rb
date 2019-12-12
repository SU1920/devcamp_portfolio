class PortfoliosController < ApplicationController
    def index
        @port_items = Portfolio.all
    end

    def new
        @portfolio_item = Portfolio.new
    end

    def create
        @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
    
        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portfolios_path, notice: 'Portfolio Item was successfully created.' }
          else
            format.html { render :new }
          end
        end
      end
    
    def edit
        @port_item = Portfolio.find(params[:id])
    end

    def update
        @port_item = Portfolio.find(params[:id])
        respond_to do |format|
          if @port_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
            format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
          else
            format.html { render :edit }
          end
        end
    end

    def show
        @port_item = Portfolio.find(params[:id])
    end

    def destroy
        #this is going to perform the lookup
        @port_item = Portfolio.find(params[:id])
        # this is going to destroy the record
        @port_item.destroy
        # Redirect
        respond_to do |format|
            format.html { redirect_to portfolios_url, notice: 'Portfolio Item was successfully destroyed.' }
        end
    end
end
