class AuthController < ApplicationController
     # POST /register
  def register
    usuario = Usuario.new(usuario_params)
    if usuario.save
      render json: { message: 'Usuario creado con éxito' }, status: :created
    else
      render json: { errors: usuario.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST /login
  def login
    usuario = Usuario.find_by(email: params[:email])
    if usuario&.authenticate(params[:password])
      token = JwtAuth.encode({ usuario_id: usuario.id })
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Credenciales inválidas' }, status: :unauthorized
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:email, :password, :password_confirmation)
  end
end
