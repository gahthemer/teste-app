import { error } from "console";
import { Request, Response, NextFunction } from "express";

async function corrigirDataHora(data:string) {
  let novaData = new Date(data)
  novaData.setHours(hora,0,0)
  return 
}


async function Reserva(req:Request, res:Response, next:NextFunction){
  const token = req.payload;
  const {pagamento,quarto} = req.body;


  if(!token.id || !pagamento || !quarto){
    return res.sendStatus(201).json({erro:"Dados incompletos"})
  }

  try{
    const dadosPedido = {
      cliente_id : token.id,
      pagamento : pagamento
    }
  
  const pedidiID = await reservaRepository.fazerPedido(dadosPedido);
  if(!pedidoID){throw new Error("errorrrr")
    let result = []

    for (let q of quartos){
      q.dataInicio = corrigirDataHora(q.dataInicio,14)
      q.Datafim = corrigirDataHora(q.dataInicio,12)
      
      const reservaID = await reservaRepository.fazerReserva(pedidoID,q)
      console.log(q)
    }
    if(!reservaID){continue}
      result.push({
        ...q,
        reservaID:reservaID,
      })
    }
    console.log(result)

    res.status(200).json({
      message:"Reserva feita com sucesso",
      pedidiID: pedidoID,
      reservas: result
  })
  }
  }catch(error){
    console.log(error)
    return res.status(400).json({erro:"Reserva nao efetuada"})
  }
}
  
export default {
  Reserva
};
