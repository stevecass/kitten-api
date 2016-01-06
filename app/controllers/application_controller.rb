class ApplicationController < ActionController::Base
  def cors_options
    render text: ''
  end
end
