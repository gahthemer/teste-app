import express from "express";
import { Request, Response, NextFunction } from "express";

const app = express();

app.use((req: Request, res: Response, next: NextFunction) => {
  res.send("Hello word!!");
});

app.use((err: Error, req: Request,res:Response, next: NextFunction) => {
  console.error(err);
  res.status(500).send("Erro na ...")
});

export default app;
