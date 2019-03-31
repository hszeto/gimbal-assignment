require 'csv'

CSV.foreach(Rails.root.join('db/cafes.csv'), headers: true) do |row|
  Cafe.create!({
    :name => row[0],
    :lat => row[1],
    :lon => row[2]
  })
end
