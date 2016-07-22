# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include Makeover::Presentable
  protect_from_forgery with: :exception
end
