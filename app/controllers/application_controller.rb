class ApplicationController < ActionController::Base
  include AuthHelper
  include FlashHelper
  protect_from_forgery
end
