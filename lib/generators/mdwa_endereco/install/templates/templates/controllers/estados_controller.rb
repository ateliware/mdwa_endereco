# -*- encoding : utf-8 -*-
<%- 
@entity = MDWA::DSL.entity('Estado') 
@model = @entity.generator_model 
-%>
class A::EstadosController < A::BackendController

  load_and_authorize_resource :class => "A::Estado"
  
  # Hook for code generations. Do not delete.
  #===controller_init===

	def index
	  @estados = A::Estado.paginate :page => params[:page]

    respond_to do |format|
      format.html
      format.js
    end
	end


	def show
    @estado = A::Estado.find(params[:id])

    render :layout => false
	end

	def new
    @estado = A::Estado.new

    render :layout => false
	end

	def edit
    @estado = A::Estado.find(params[:id])

    render :layout => false
	end

	def create
    @estado = A::Estado.new(params[:a_estado])
    saved_ok = @estado.save
    @system_notice = t('estados.create_success') if saved_ok    
    load_list # loads all estados to display in the list
  

    respond_to do |format|
      format.js
    end
	end

	def update
    @estado = A::Estado.find(params[:id])
    saved_ok = @estado.update_attributes(params[:a_estado])
    @system_notice = t('estados.update_success') if saved_ok
    load_list # loads all estados to display in the list
  
    
    respond_to do |format|
      format.js
    end
	end

	def destroy
    @estado = A::Estado.find(params[:id])
    @system_notice = t('estados.destroy_success') if @estado.destroy
    load_list # loads all estados to display in the list
    
    respond_to do |format|
      format.js
    end
	end
	
	
	private
		def load_list
			@estados = A::Estado.paginate :page => 1
		end

end