import { Request, Response, NextFunction } from "express";
import loginRepository from "../repositories/loginRepository";
import { error } from "console";
import { validarSenha } from "../utils/senha";
import { createJWT } from "../utils/jwt";

async function Client(req:Request, res:Response, next:NextFunction){
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


   const resultSenha = await validarSenha(senha,result.senha)
   if(!resultSenha){throw new Error("Senha invalida")}

   const {senha:_senha,...usuario}= result

   const token = createJWT(usuario)
   return res.status(200).json(token);

  }catch (error){
    return res.sendStatus(400).json({error:"Credenciais invalidas!"})
  }
   
}

export default {
  Client
};
