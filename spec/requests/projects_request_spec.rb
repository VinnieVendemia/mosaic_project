require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe 'GET /projects' do
    let(:params) do
      {
        school_name: 'BRONX'
      }
    end

    before { get '/projects', params: params }

    it 'returns projects' do
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /projects/:id' do
    before { get "/projects/1", params: {} }

    context 'when the record exists' do
      it 'returns the project' do
        json = JSON.parse(response.body)
        expect(json).not_to be_empty
        expect(json['id']).to eq(1)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST /projects' do
    let(:valid_attributes) do
      {
        school_name: 'SCHOOL NAME',
        description: 'SCHOOL description',
        phase_actual_start_date: '01/01/2019',
        phase_planned_end_date: '01/01/2020',
        phase_actual_end_date: '01/01/2020',
        budget_amount: 100,
        final_estimate_annual_costs: 200,
        total_phase_actual_spending: 300,
      }
    end

    context 'when the request is valid' do
      before do
        post '/projects', params: valid_attributes
      end

      it 'creates record with school_name' do
        json = JSON.parse(response.body)
        expect(json['school_name']).to eq(valid_attributes[:school_name])
      end

      it 'creates record with description' do
        json = JSON.parse(response.body)
        expect(json['description']).to eq(valid_attributes[:description])
      end

      it 'creates record with phase_actual_start_date' do
        json = JSON.parse(response.body)
        expect(json['phase_actual_start_date']).to eq('2019-01-01')
      end

      it 'creates record with phase_planned_end_date' do
        json = JSON.parse(response.body)
        expect(json['phase_planned_end_date']).to eq('2020-01-01')
      end

      it 'creates record with phase_actual_end_date' do
        json = JSON.parse(response.body)
        expect(json['phase_actual_end_date']).to eq('2020-01-01')
      end

      it 'creates record with budget_amount' do
        json = JSON.parse(response.body)
        expect(json['budget_amount']).to eq(valid_attributes[:budget_amount])
      end

      it 'creates record with final_estimate_annual_costs' do
        json = JSON.parse(response.body)
        expect(json['final_estimate_annual_costs']).to eq(valid_attributes[:final_estimate_annual_costs])
      end

      it 'creates record with total_phase_actual_spending' do
        json = JSON.parse(response.body)
        expect(json['total_phase_actual_spending']).to eq(valid_attributes[:total_phase_actual_spending])
      end
    end
  end

  describe 'PUT /projects/:id' do
    let(:valid_attributes) { { school_name: 'UPDATED SCHOOL NAME' } }

    context 'when the record exists' do
      before do
        put "/projects/1", params: valid_attributes
      end

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
