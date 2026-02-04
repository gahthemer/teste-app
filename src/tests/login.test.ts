const URL_BASi: string = "http://localhost:3000/api/login";

let login_id: number = 0

const criar = {
    email: "Neymar@gmail",
    senha: "Eutentei"
}

test("POST: /login = 201(Criar login)", async()=>{
    const res = await fetch(URL_BASi, {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(criar)
    })
    expect(res.status).toBe(200);

    // const content = await res.json()
    // login_id = content.id
    // expect(content).toHaveProperty("id")
    // expect(content).toHaveProperty("email")
    // expect(content).toHaveProperty("senha")
})