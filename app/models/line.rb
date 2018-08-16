class Line < ApplicationRecord
  DATATABLE_COLUMNS = %w[season episode character line].freeze

  class << self
    def datatable_filter(search_value, search_columns)
      return all if search_value.blank?

      result = none
      search_columns.each do |key, value|
        filter = where("#{DATATABLE_COLUMNS[key.to_i]} ILIKE ?", "%#{search_value}%")
        result = result.or(filter) if value['searchable']
      end
      result
    end

    def datatable_order(order_column_index, order_dir)
      order("#{Line::DATATABLE_COLUMNS[order_column_index]} #{order_dir}")
    end
  end
end
