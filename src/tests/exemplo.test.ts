import { error } from "console";
import { json } from "stream/consumers";

  
const URL_base = "http://localhost:3000/task"

let tarefa_id: number = 0

const nova_tarefa ={
  nome: "Nome da tarefa",
  descricao: "atualizou"
}

const tarefa_atualizada ={
  nome: "Nome da tarefa atualizada",
  descricao: "Descricao da tarefa de exemplo",
};

test("GET: /tarefas = 200", async ()=>{
  const res = await fetch(URL_base)
  expect(res.status).toBe(200)

  const body = await res.json()
  expect(Array.isArray(body)).toBe(true) 
})

test("POST: /task = 201(Criar tarefa",async()=>{
  const res = await fetch(URL_base,{
    method: "POST",
    headers:{"Content-Type": "application/json"},
    body: JSON.stringify(nova_tarefa)
  });
  expect(res.status).toBe(201);

  const content = await res.json()
  tarefa_id = content.id

  expect(content).toHaveProperty("id")
  expect(content).toHaveProperty("nome")
  expect(content).toHaveProperty("descricao")
})

test("GET: /task = 200", async()=>{
  const res = await fetch(`${URL_base}/${tarefa_id}`)
  expect(res.status).toBe(200);

  const content = await res.json()
  expect(content).toHaveProperty("nome",nova_tarefa["nome"])
  expect(content).toHaveProperty("descricao",nova_tarefa["descricao"])
})

test ("PUT: /task/1 = 200 (atualizar tarefa)", async()=>{
  const res = await fetch(`${URL_base}/${tarefa_id}`,{
    method:"PUT",
    headers:{"Content-Type": "application/json"},
    body: JSON.stringify(tarefa_atualizada)
  })
  expect(res.status).toBe(201);
})

test("DELETE: /task/:id = 204",async()=>{
  const res = await fetch(`${URL_base}/${tarefa_id}`,{
    method:"DELETE"
  })
  expect(res.status).toBe(200)

  const content = await res.json()

  expect(content).toHaveProperty("id")
  expect(content).toHaveProperty("nome")
  expect(content).toHaveProperty("descricao")

})

test("Post: /task = 400 (Erro Criar tarefa)",async()=>{
  const res = await fetch(URL_base,{
    method:"POST",
    headers: {"Content-Type":"application/json"},
    body:JSON.stringify({})
  })
  expect(res.status).toBe(400);

  const content = await res.json()
  expect(content).toHaveProperty("erro","dados invalidos")
})


