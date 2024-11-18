class TemperatureController < ApplicationController
  ABSOLUTE_ZERO_C = -273.15
  ABSOLUTE_ZERO_F = -459.67

  def convert
    input = params[:value].to_f
    scale = params[:scale]

    if invalid_temperature?(input, scale)
      render json: { error: "Temperature cannot be below absolute zero: #{ABSOLUTE_ZERO_C}°C or #{ABSOLUTE_ZERO_F}°F." }, status: :unprocessable_entity
      return
    end

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

  private

  def invalid_temperature?(input, scale)
    (scale == 'C' && input < ABSOLUTE_ZERO_C) || (scale == 'F' && input < ABSOLUTE_ZERO_F)
  end
end
