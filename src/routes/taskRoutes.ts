import { Router } from "express";
import taskControllers from "../controllers/taskControllers";

const router = Router();

router.get("/",taskControllers.getTarefas)

router.get("/:id",taskControllers.getTarefa)

router.post("/",taskControllers.criarTarefa)

router.put("/:id",taskControllers.atualizarTarefa)

router.delete("/:id",taskControllers.deletarTarefa)

export default router;
