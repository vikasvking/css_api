class DumpersController < ApplicationController
	before_action :require_authentication
	before_action :require_admin, only: %i[create update destroy]
	
	def index
		render json: Dumper.all
	end

	def show
		render json: Dumper.find[parama[:id]]
	end

	def create
		@dumper=Dumper.new(dumper_params)
		if @dumper.save
			render json: @dumper, status: :created
		else
			render json: {error: @dumper.errors}, status: :unprocessable_entity
		end
	end


	def update
		@dumper =Dumper.find(params[:id])
		if @dumper.update(dumper_params)
			render json: @dumper
		else
			render json: {error: @dumper.errors},status: :unprocessable_entity
		end
	end

	def destroy
		@dumper=Dumper.find(params[:id])
		@dumper.destroy
		head :no_content
		
	end

	private

	def require_admin
		unless Current.user&.admin?
			render json: {error: "Admin access required"},status: :forbiddent
		end
	end

	def dumper_params
		params.require(:dumper).permit(:slno,:location,:make,:model,:fl,:fr,:rli,:rlo,:rri,:rro,:fatigue)
	end

end
