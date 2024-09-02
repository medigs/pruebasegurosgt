class UsuariosController < ApplicationController
    before_action :set_usuario, only: [:show, :update, :destroy, :update_estado]

    # GET /usuarios
    def index
      @usuarios = Usuario.all
      render json: @usuarios
    end
  
    # GET /usuarios/:id
    def show
      render json: @usuario
    end
  
    # POST /usuarios
    def create
      @usuario = Usuario.new(usuario_params)
  
      if @usuario.save
        render json: @usuario, status: :created
      else
        render json: @usuario.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /usuarios/:id
    def update
      if @usuario.update(usuario_params)
        render json: @usuario
      else
        render json: @usuario.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /usuarios/:id
    def destroy
      @usuario.destroy
      head :no_content
    end
  
    # PATCH /usuarios/:id/update_estado
    def update_estado
      if @usuario.active
        @usuario.update(active: false)
        render json: @usuario
      else
        render json: { error: "El usuario ya está inactivo y no puede ser cambiado a inactivo." }, status: :forbidden
      end
    end
  
    private
  
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end
  
    def usuario_params
      params.require(:usuario).permit(:email, :password, :active)
    end
end
