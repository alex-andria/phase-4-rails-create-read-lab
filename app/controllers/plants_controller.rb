class PlantsController < ApplicationController
    wrap_parameters format: []
    def index
        render json: Plant.all, status: :ok
    end

    def show
        # find_by(id: params[:id]) if using if/else. just .find(params[:id]) for params w/o if/else
        plant = Plant.find_by(id: params[:id])

        if plant
            render json: plant, status: :ok
        else
            render json: { error: "Plant not found" }, status: :not_found
        end
    end

    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end

end
