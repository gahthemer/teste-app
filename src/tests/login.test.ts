const url_base:string = "https://teste-app-nu.vercel.app/api/login";
 
test("POST / login = 200", async () => {
    const res = await fetch(url_base, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
            email: "teste23@email.com",
            senha: "senha123"}
        )
    });

    const json = await res.json()
    console.log(json);
    expect(res.status).toBe(200);
});


// test("POST / login(sem senha) = 400", async () => {
//     const res = await fetch(url_base, {
//         method: "POST",
//         headers: { "Content-Type": "application/json" },
//         body: JSON.stringify({
//             email: "teste@email.com",
//             senha: ""}
//         )
//     });
//     expect(res.status).toBe(400);
// });


// test("POST / create = 200", async () => {
//     const res = await fetch(url_base + "/cadastro" , {
//         method: "POST",
//         headers: { "Content-Type": "application/json" },
//         body: JSON.stringify({
//             nome: "nomeTeste",
//             email: "pedroca@email.com",
//             senha: "comoPacoca",
//             telefone: "4002-8921",
//             cpf:"123456789-67"
//         })
//     });
//     expect(res.status).toBe(200);
//     const token = await res.json();
//     // console.log(token)
// });