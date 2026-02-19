import { Router } from "express";
import quartosController from "../controllers/quartosControllers";
 
const rotaQuartos = Router();
 
rotaQuartos.post("/", quartosController.disponivel);
 
 
export default rotaQuartos;