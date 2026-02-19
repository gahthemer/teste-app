import { Router } from "express";
import ReservaControllers from "../controllers/ReservaControllers"
 
const rotaReserva = Router();
 
rotaReserva.post("/", ReservaControllers.Reserva);
 
 
export default rotaReserva;