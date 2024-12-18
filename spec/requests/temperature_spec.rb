require 'swagger_helper'

RSpec.describe 'Temperature API', type: :request do
  path '/convert' do
    get 'Converts temperature between Celsius and Fahrenheit' do
      tags 'Temperature'
      produces 'application/json'
      parameter name: :value, in: :query, schema: { type: :number }, required: true, description: 'Temperature value to convert'
      parameter name: :scale, in: :query, schema: { type: :string, enum: ['C', 'F'] }, required: true, description: 'The current scale of the temperature ("C" for Celsius, "F" for Fahrenheit)'

      response '200', 'temperature converted successfully' do
        let(:value) { 100 }
        let(:scale) { 'C' }

        run_test!
      end

      response '400', 'invalid request - invalid scale' do
        let(:value) { 100 }
        let(:scale) { 'invalid' }

        run_test!
      end

      response '422', 'temperature below absolute zero' do
        let(:value) { -300 }
        let(:scale) { 'C' }

        run_test!
      end
    end
  end
end
