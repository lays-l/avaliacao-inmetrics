module SiteCommons
  def take_screenshot(file_name, result)
    timer_path = Time.now.strftime('%Y_%m_%d').to_s
    file_path = "report/screenshots/test_#{result}/run_#{timer_path}/"
    screenshot = file_path + "#{file_name}.png"
    log("Screenshot URL: #{current_url}")
    log("Para visualizar o print acesse o diretório /report/screenshots, buscando pela imagem : \n #{screenshot}")
    page.save_screenshot(screenshot)
    attach(Base64.encode64(File.open(screenshot, 'r:UTF-8', &:read)), 'image/png;base64')
  end
end