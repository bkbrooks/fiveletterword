class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  def handle_options_request
    headers['Access-Control-Allow-Headers'] =
      'accept, authorization, content-type, X-Recoder-API-Version'
    return head(:ok) if request.request_method == 'OPTIONS'
  end
end
