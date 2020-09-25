module SiteCommons
  # metodo em fase de migracao pro load_data_by, deve ser removido nos proximos meses
  def data_load(keys)
    data = search(keys, STANDARD_DATA || {})
    return data
  end

  def search(keys, data)
    keys = keys.split(' ') if keys.instance_of? String
    keys.each do |key|
      data = data[key]
      break if data.nil?
    end
    data
  end
end