import { Router } from "express";
import ClientControllers from "../controllers/ClientControllers"
 
const rotaClint = Router();
 
rotaClint.post("/", ClientControllers.Client);
 
 
export default rotaClint;