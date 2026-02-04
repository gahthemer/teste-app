import { Router } from "express";
import loginController from "../controllers/LoginControllers";
 
const rotaLogin = Router();
 
rotaLogin.post("/", loginController.Login);
 
 
export default rotaLogin;