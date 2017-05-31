class WelcomeController < ApplicationController
   render json: { status: 200, message: "GOP SERVER API" }
end
