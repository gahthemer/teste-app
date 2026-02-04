import { Request, Response, NextFunction } from "express";
import loginRepository from "../repositories/loginRepository";
import { error } from "console";

async function Login(req:Request, res:Response, next:NextFunction){
  const{email,senha}=req.body;

  if(!email || !senha){
    return res.status(400).json({erro:"Email e senha são obrigatorios"})
  }
  if(email.trim() === "" || senha.trim() === ""){
    return res.status(400).json({erro:"Email ou Senha estão vazios"})
  }

  try{
  const result  = await loginRepository.validarLogin(email);
   if (!result){throw new Error()}

   console.log(result.email)
   console.log(result.senha)
  return res.sendStatus(200);
  }catch (error){
    return res.sendStatus(400).json({error:"Credenciais invalidas!"})
  }
   
}

export default {
  Login
};
