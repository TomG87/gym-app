class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
    render :index
  end

  def other 
    muscle = params[:muscle]
    url = URI("https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = Rails.application.credentials.fetch(:gym_api)[:api_key]
    request["X-RapidAPI-Host"] = 'exercises-by-api-ninjas.p.rapidapi.com'

    response = http.request(request)
    render json: response.read_body
  end
end
