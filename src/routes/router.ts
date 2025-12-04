import { Router } from "express";
import rotaTarefa from "./taskRoutes";
import { createJWT } from "../utils/jwt";

const handlerRouter = Router();

// rotas publicas
  handlerRouter.use("/task",rotaTarefa);

  handlerRouter.use("/jwt",(req,res)=>{
    res.json(createJWT())
  });

// rotas privadas


export default handlerRouter
