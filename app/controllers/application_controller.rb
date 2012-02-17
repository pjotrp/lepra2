class ApplicationController < ActionController::Base
  # before_filter :authenticate_user!, :except => [:index]  
  if not ENV['RAILS_TEST']
    before_filter :authenticate_user!
  end
  protect_from_forgery
end
