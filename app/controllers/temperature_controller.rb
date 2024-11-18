class TemperatureController < ApplicationController
  def convert
    input = params[:value].to_f
    scale = params[:scale]

    if scale == 'C'
      result = (input * 9 / 5) + 32
      unit = 'F'
    elsif scale == 'F'
      result = (input - 32) * 5 / 9
      unit = 'C'
    else
      render json: { error: 'Invalid scale. Use "C" for Celsius or "F" for Fahrenheit.' }, status: :bad_request
      return
    end

    render json: { input: input, scale: scale, converted_value: result.round(2), converted_scale: unit }
  end
end
