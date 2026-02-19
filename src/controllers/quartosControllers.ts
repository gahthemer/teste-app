import { Request, Response, NextFunction } from "express";
import loginRepository from "../repositories/loginRepository";
import { error } from "console";
import { validarSenha } from "../utils/senha";
import { createJWT } from "../utils/jwt";

async function disponivel(req:Request, res:Response,nesxt:NextFunction) {
    const{dataInicio,Datafim,quantidade}=req.body;

    if(!dataInicio || !Datafim || !quantidade){
        return res.status(400).json({error:"igjgksjpig"})
    }

    const dados = {dataInicio,Datafim,quantidade}

    try{
        let quartos = await quartosRepository.disponiveis(dados)
        if (!quartos){throw new Error("Erro")}

        for (let q of quartos){
            const fotos = await quartosRepository.buscarFotoPorQuartoId(q.id);
            q.fotos = fotos
        }
        reservaIdCriado.status(200).json(quartos);

    }catch(erro){
        console.log(error)
        return res.status(400).json({erro:"jfjssfsf"})
    }

}
export default{
    disponivel
}