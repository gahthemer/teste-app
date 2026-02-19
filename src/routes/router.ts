import { Router } from "express";
import rotaTarefa from "./tarefasRouter";
import { createJWT } from "../utils/jwt";
import { middleware } from "./jwtMiddleware";
import rotaLogin from "./Login";
import rotaClint from "./Client";
import rotaReserva from "./Reserva";
import rotaQuartos from "./Quartos";

const handlerRouter = Router();

// rotas publicas
handlerRouter.use("/tarefas", rotaTarefa);
handlerRouter.use("/api/login", rotaLogin);
handlerRouter.use("/api/clint", rotaClint);
handlerRouter.use("/api/Reserva", rotaReserva);
handlerRouter.use("/api/quartosDisponiveis", rotaQuartos);

handlerRouter.use("/jwt", (req, res)=>{
    const payload = {
        id: 123,
        nome: "fulano",
        cargo: "cliente"
    }
    res.json(createJWT(payload))
})

// rotas privadas
handlerRouter.get("/testeJWT", middleware, (req, res)=>{
    res.json("passou pelo JWT middleware")
})

export default handlerRouter