class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
