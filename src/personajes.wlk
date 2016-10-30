import casa.*
import ciudades.*
import estado.*
import acompaniantes.*
import personalidad.*
import conspiraciones.*

class Personaje{
	
	var casa
	var conyugues = []
	var estado
	var acompaniantes = []
	var personalidad
	
	constructor(unaCasa, unosConyugues, unEstado, unosAcompaniantes, unaPersonalidad){
		casa = unaCasa
		conyugues = unosConyugues
		estado = unEstado
		acompaniantes = unosAcompaniantes
		personalidad = unaPersonalidad
	}
	
	method casa(){
		return casa
	}
	
	method conyugues(){
		return conyugues
	}
	
	method estaVivo(){
		return estado.vive()
	}
	
	method estado(unEstado){
		estado = unEstado
	}
	
	method esDeStark(){
		return casa == stark
	}
	
	method patrimonio(){
		return casa.patrimonio() / casa.cantidadDeMiembros()
	}
	
	method estaSinPareja(){
		return conyugues.isEmpty()
	}
	
	method lePermitenCasarseCon(unaPareja){
		return casa.permiteCasamientoDe(self) && casa.permiteCasamientoCon(unaPareja)	
	}
	
	method agregarConyugue(unConyugue){
		conyugues.add(unConyugue)
	}
	
	method casarseCon(unaPareja){
		if (self.lePermitenCasarseCon(unaPareja)){
			self.agregarConyugue(unaPareja)
			unaPareja.agregarConyugue(self)
		}
		else{
			error.throwWithMessage("No pueden casarse")
		}
	}
	
	method estaSinAcompaniantes(){
		return acompaniantes.isEmpty()
	}
	
	method aliados(){
		return (conyugues + acompaniantes + casa.miembros()).asSet().asList()
	}
	
	method aliadosRicos(){
		return self.aliados().sum({unAliado => unAliado.patrimonio()}) > 1000
		
	}
	
	method conyuguesRicos(){
		return conyugues.all({unConyugue => unConyugue.casa().esRica()})
	}
	
	method tieneUnAliadoPeligroso(){
		return self.aliados().any({unAliado => unAliado.esPeligroso()})
	}
	
	method esPeligroso(){
		return self.estaVivo() && (self.aliadosRicos() || self.conyuguesRicos() || self.tieneUnAliadoPeligroso())
	}
	
	method esAsesinado(){
		estado = muerto
	}
	
	method ejecutarAccionConspirativaContra(unPersonaje){
		personalidad.ejecutarAccionConspirativaContra(personajeObjetivo)
	}
}