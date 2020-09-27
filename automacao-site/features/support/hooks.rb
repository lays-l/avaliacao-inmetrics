After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')

  if scenario.failed?
    take_screenshot(scenario_name.downcase!, 'failed') 
  else
    take_screenshot(scenario_name.downcase!, 'success')
  end
end