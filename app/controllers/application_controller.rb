class ApplicationController < ActionController::Base
  def render_403
    render file:'public/403.html'
  end

  def render_404
    render file:'public/404.html'
  end

  def is_admin
    render_403 unless params[:admin]
  end
end
