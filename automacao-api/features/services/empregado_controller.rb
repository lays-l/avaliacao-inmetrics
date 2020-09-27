module Rest
  class EmpregadoController
    include HTTParty

    headers 'Content-Type' => 'application/json'
    base_uri CONFIG['base_uri']

    def retornar_todos_usuarios
      self.class.get('/empregado/list_all', basic_auth: { username: 'inmetrics', password: 'automacao' })
    end

    def retornar_usuario(id)
      self.class.get("/empregado/list/#{id}", basic_auth: { username: 'inmetrics', password: 'automacao' })
    end

    def cadastrar_usuario(payload)
      self.class.post('/empregado/cadastrar', basic_auth: { username: 'inmetrics', password: 'automacao' }, body: payload.to_json)
    end

    def alterar_usuario(id, payload)
      self.class.put("/empregado/alterar/#{id}", basic_auth: { username: 'inmetrics', password: 'automacao' }, body: payload.to_json)
    end
  end
end
