import { json } from "stream/consumers";

const URL_BASe: string = "http://localhost:3000/api/Client";

let client_id: number = 0

const criar = {
    nome:"Pikachu",
    email: "Pikachu@gmail",
    telefone: "151",
    cpf:"251",
    senha: "choque"
}

test("POST: /Client = 201(Criar Client)", async()=>{
    const res = await fetch(URL_BASe, {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(criar)
    })
    expect(res.status).toBe(200);

     const json = await res.json()
     console.log(json);
    // login_id = content.id
    // expect(content).toHaveProperty("id")
    // expect(content).toHaveProperty("email")
    // expect(content).toHaveProperty("senha")
})