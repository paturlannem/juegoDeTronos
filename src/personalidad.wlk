import casa.*
import ciudades.*
import estado.*
import acompaniantes.*
import personajes.*

object sutil{
	method ejecutarAccionConspirativaContra(unPersonaje){
		var pareja = guardiaDeLaNoche.miembros().find({unMiembro => unMiembro.estaVivo() && unMiembro.estaSinPareja()})
		if (guardiaDeLaNoche.miembros().any({unMiembro => unMiembro.estaVivo() && unMiembro.estaSinPareja()})){
			unPersonaje.casarseCon(pareja)
		}
		else{
			error.throwWithMessage("No existe nadie para casar o no se puede casar con nadie")
		}
	}
}

object asesino{
	method ejecutarAccionConspirativaContra(unPersonaje){
		unPersonaje.esAsesinado()
	}
}