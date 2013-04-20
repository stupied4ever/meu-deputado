class DeputadosController < ApplicationController
	respond_to :html, :json

	def index
		respond_with Deputado.all, 
			:except  => [:created_at, :anexo, :updated_at, :sexo], 
			:methods => [:foto]
	end

	def show
		respond_with Deputado.find(params[:id]), 
			:except  => [:created_at, :anexo, :updated_at, :sexo], 
			:methods => [:foto]
	end
end