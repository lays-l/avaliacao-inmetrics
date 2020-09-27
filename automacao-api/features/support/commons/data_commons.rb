module ApiCommons
  def api_data_load(keys)
    data = search(keys, STANDARD_DATA || {})
    data
  end

  def search(keys, data)
    keys = keys.split(' ') if keys.instance_of? String
    keys.each do |key|
      data = data[key]
      break if data.nil?
    end
    data
  end

  def create_data_table(data_table)
    data_table_hash = {}
    data_table&.rows_hash&.each { |value| data_table_hash[value.first] = (/(^$)|(^<.*>$)|( )/ =~ value.last).nil? ? value.last : nil }
    data_table_hash
  end
end
