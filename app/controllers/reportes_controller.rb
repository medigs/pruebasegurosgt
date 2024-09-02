class ReportesController < ApplicationController
  before_action :set_reporte, only: [:show, :update, :destroy, :update_estado]

  # GET /reportes
  def index
    @reportes = Reporte.joins(:usuario).where(usuarios: { active: true })

    if @reportes.any?
      render json: @reportes
    else
      render json: { error: "No se encontraron reportes para usuarios activos." }, status: :not_found
    end
  end

  # GET /reportes/:id
  def show
    if @reporte
      render json: @reporte
    else
      render json: { error: "Reporte no encontrado." }, status: :not_found
    end
  end

  # POST /reportes
  def create
    @reporte = Reporte.new(reporte_params)

    if @reporte.save
      render json: @reporte, status: :created
    else
      render json: { error: "No se pudo crear el reporte.", details: @reporte.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reportes/:id
  def update
    if @reporte.update(reporte_params)
      render json: @reporte
    else
      render json: { error: "No se pudo actualizar el reporte.", details: @reporte.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /reportes/:id
  def destroy
    if @reporte.destroy
      head :no_content
    else
      render json: { error: "No se pudo eliminar el reporte." }, status: :unprocessable_entity
    end
  end

  # PATCH /reportes/:id/update_estado
  def update_estado
    case @reporte.estado
    when "com"
      render json: { error: "El reporte ya está en estado COM y no puede ser cambiado." }, status: :forbidden
    when "act"
      if @reporte.update(estado: :rec)
        render json: @reporte
      else
        render json: { error: "No se pudo actualizar el estado del reporte.", details: @reporte.errors.full_messages }, status: :unprocessable_entity
      end
    when "rec"
      if @reporte.update(estado: :com)
        render json: @reporte
      else
        render json: { error: "No se pudo actualizar el estado del reporte.", details: @reporte.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Estado no válido para cambiar." }, status: :unprocessable_entity
    end
  end

  private

  def set_reporte
    @reporte = Reporte.find_by(id: params[:id])
    render json: { error: "Reporte no encontrado." }, status: :not_found unless @reporte
  end

  def reporte_params
    params.require(:reporte).permit(:nombre_reporte, :estado, :usuario_id)
  end
end
