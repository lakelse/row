
require 'mysql2'

client = Mysql2::Client.new(host: '', username: '', password: '')

sql = 'select NOW() as timestamp'

result = client.query(sql)

result.each do |row|
  puts row['timestamp']
end
