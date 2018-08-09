require 'csv'

namespace :data do
  desc 'drop data'
  task drop: :environment do
    Line.delete_all
  end

  desc 'populate data'
  task populate: :environment do
    batch_size = 2000
    i = 0

    File.open("public/data.csv") do |file|
      headers = file.first
      file.lazy.each_slice(batch_size) do |lines|
        csv_rows = CSV.parse(lines.join, headers: headers, liberal_parsing: true)

        csv_rows.each do |row|
          i += 1
          next if row.to_h.values.join(',') == headers.strip
          next if Line.where(season: row[0], episode: row[1]).count >= 2
          Line.create(season: row[0], episode: row[1], character: row[2], line: row[3])
          puts "Processed line #{i}: #{row[3]&.slice(0, 20)}"
        end
      end
    end
  end
end