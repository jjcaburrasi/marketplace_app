class ApplicationController < ActionController::Base

    def hello
        render html: "This is the Marketplace App"
    end
end
