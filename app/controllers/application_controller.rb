class ApplicationController < ActionController::Base
    include SetCurrentVisitor
    before_action :enable
end
