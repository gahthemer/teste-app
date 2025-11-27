  import { resolve } from "path"
import Tarefa from "../models/task"
import { rejects } from "assert"

  const tarefas:Tarefa[] = []

  async function getTarefas():Promise<Tarefa[]|any> {
    return new Promise((resolve,reject)=>{
      return resolve(tarefas)
    })
  }

  async function getTarefa(id:number):Promise<Tarefa|any>{
    return new Promise ((resolve,reject)=>{
      const tarefa = tarefas.find(t => t.id === id)
      return resolve(tarefa)
    })
  }

  async function criarTarefa(data:Tarefa):Promise<Tarefa> {
    return new Promise((resolve,reject)=>{
      if (!data.nome || !data.descricao){
        return reject(new Error("Dados invalidos"))
      }
      const novaTarefa = new Tarefa(data.nome , data.descricao)
      tarefas.push(novaTarefa)
      return resolve(novaTarefa)
    })
  }

  async function atualizarTarefa(id:number,dados:Tarefa):Promise <Tarefa> {
    return new Promise ((resolve,reject)=>{
      const indice = tarefas.findIndex(t => t.id === id)
      if(indice === -1){
        return reject(new Error("Tarefa nao encotrada"))
      }
      tarefas[indice].nome = dados.nome
      tarefas[indice].descricao = dados.descricao
      return resolve (tarefas[indice])
    })
  }

  async function deletarTarefa(id:number): Promise<Tarefa> {
    return new Promise ((resolve,reject)=>{
      const indice = tarefas.findIndex(t => t.id === id)
      if(indice === -1){
        return reject(new Error("Tarefa nao encotrada"))
      }
      const [tarefa] = tarefas.splice(indice,1)
      return resolve(tarefa)
    })
  }

  export default{
    getTarefas,getTarefa,criarTarefa,atualizarTarefa,deletarTarefa
  }
