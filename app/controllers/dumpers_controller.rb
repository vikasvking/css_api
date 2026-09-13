class DumpersController < ApplicationController
	def index
		render json: Dumper.all
	end
end
