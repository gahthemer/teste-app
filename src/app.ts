import express from "express";
import { Request, Response, NextFunction } from "express";
import router from "./routes/taskRoutes";

const app = express();
app.use(express.json());
app.use("/task",router);




/* app.get("/parametro/:nome",(req:Request,res:Response,next:NextFunction)=>{
    const nome = req.params.nome
    console.log("Rota de parametro - Cliente digitou:",nome)
    res.send(`voce digitou o nome ${nome}`)
})

app.get("/query",(req:Request,res:Response,next:NextFunction)=>{
    const nome = req.query.nome
    console.log("Cliente digitou:",nome)
    res.send(`voce digitou o nome ${nome}`)
})

app.get("/corpo",(req:Request,res:Response,next:NextFunction)=>{
    const nome = req.body.nome;
    console.log("Variavel dentro do corpo - Cliente digitou:",nome)
    res.send(`voce digitou o nome ${nome}`)
})

app.get("/exemplo",(req:Request,res:Response,next:NextFunction)=>{
  console.log('aconteceu algo')
  res.send("rodou tudo certo!!")
})

app.use((req: Request, res: Response, next: NextFunction) => {
  res.send("Hello word!!");
});

app.use((err: Error, req: Request,res:Response, next: NextFunction) => {
  console.error(err);
  res.status(500).send("Erro na ...")
}); */

export default app;
