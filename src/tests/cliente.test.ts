import { json } from "stream/consumers";

const BASE_URL = "http://localhost:3000";  // ← tire /api/Client daqui

const criar = {
  nome: "Pikachu",
  email: "pikachu@gmail.com",     // ← email válido (sem @ faltando)
  telefone: "151",
  cpf: "251",
  senha: "choque"
};

test("POST /clients → deve criar cliente e retornar 201", async () => {
  // Ajuste o caminho aqui ↓ conforme sua rota real
  const url = `${BASE_URL}/api/Clint`;          // ← mude para o caminho correto
  // Exemplos: /api/clientes  /clients  /api/v1/client  etc.

  const res = await fetch(url, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(criar)
  });

  console.log("Status recebido:", res.status);     // ← ajuda a debuggar

  expect(res.status).toBe(201);   // ← quase sempre é 201 para criação

  const data = await res.json();
  console.log("Resposta:", data);

  expect(data).toHaveProperty("id");
  // expect(data.email).toBe(criar.email);        // opcional
  // client_id = data.id;                         // se quiser usar depois
});