import personajes.*
import casa.*
import ciudades.*
import estado.*
import acompaniantes.*
import personalidad.*

class Conspiracion{
	var personajeObjetivo
	var complotados = []
	var ejecutada = false
	
	constructor(unObjetivo, losComplotados){
		personajeObjetivo = unObjetivo
		complotados = losComplotados
	}
	
	method personajeObjetivo(){
		return personajeObjetivo
	}
	
	method ejecutada(){
		return ejecutada
	}
	
	method complotadosTraidores(){
		return complotados.filter({unComplotado => personajeObjetivo.aliados().contains(unComplotado)})
	}
	
	method cantDeTraidores(){
		return self.complotadosTraidores().size()
	}
	
	method ejecutarConspiracion(){
		ejecutada = true
		complotados.map({unComplotado => unComplotado.personalidad().ejecutarAccionConspirativaContra(personajeObjetivo)})
	}
}

object conspiracion{
	
	var conspiracion
	
	method 	crear(unObjetivo, listaDeComplotados){
		if (unObjetivo.esPeligroso()){
			conspiracion = new Conspiracion(unObjetivo, listaDeComplotados)
		}
		else{
			error.throwWithMessage("El personaje no es peligroso como para crear una conspiracion en su contra")
		}
	}
	
	method ejecutar(){
		conspiracion.ejecutarConspiracion()
	}
	
	method conspiracionSatisfactoria(){
		return conspiracion.ejecutada() && !conspiracion.personajeObjetivo().esPeligroso()
	}
}