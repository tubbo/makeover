class ApplicationController < ActionController::Base

  include Presenters::Presentable
  protect_from_forgery with: :exception
end
