class PagesController < ApplicationController
  def home
  end

  def get_dataset
    render json: { lines: Line.all }
  end

  def get_processed_dataset
    lines = Line.datatable_filter(params['search']['value'], params['columns'])
    lines_filtered = lines.count
    lines = lines.datatable_order(params['order']['0']['column'].to_i,
                                  params['order']['0']['dir'])
    lines = lines.page(params['start'].to_i + 1).per(params['length'])

    render json: { lines: lines,
                   draw: params['draw'].to_i,
                   recordsTotal: Line.count,
                   recordsFiltered: lines_filtered }
  end
end
