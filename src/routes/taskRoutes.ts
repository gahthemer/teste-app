import { Router } from "express";
import taskControllers from "../controllers/taskControllers";

const rotaTarefa = Router();

rotaTarefa.get("/",taskControllers.getTarefas)

rotaTarefa.get("/:id",taskControllers.getTarefa)

rotaTarefa.post("/",taskControllers.criarTarefa)

rotaTarefa.put("/:id",taskControllers.atualizarTarefa)

rotaTarefa.delete("/:id",taskControllers.deletarTarefa)

export default rotaTarefa;
