test("POST: /api/quartosDisponiveis = 200", async()=>{
    const resp = await fetch("https://teste-app-nu.vercel.app/api/quartosDisponiveis",{
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
            inicio:"2026/05/18",
            fim:"2026/07/20",
            quantidade:1
        })
    });
    expect(resp.status).toBe(200);
    const json = await resp.json()
    // console.log(json)
})