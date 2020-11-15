module SerializerUtils

  def render_success_json(message)
    render json: { result: true, message: message }
  end

  def render_failed_json(message)
    render json: { result: false, message: message }
  end

end