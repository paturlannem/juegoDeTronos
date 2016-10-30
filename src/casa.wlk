import ciudades.*


class Casa{
	
	var patrimonio
	var ciudad
	var miembros = []
	
	constructor(unPatrimonio, unaCiudad){
		patrimonio = unPatrimonio
		ciudad = unaCiudad
	}
	
	method esRica(){
		return patrimonio > 1000
	}
	
	method patrimonio(){
		return patrimonio
	}
	
	method patrimonio(unPatrimonio){
		patrimonio = unPatrimonio
	}
	
	method ciudad(unaCiudad){
		ciudad = unaCiudad
	}
	
	method miembros(){
		return miembros
	}
	
	method agregarMiembro(unMiembro){
		miembros.add(unMiembro)
	}
	
	method cantidadDeMiembros(){
		return miembros.size()
	}
	
	method esStark(){
		return false
	}
}

object lannister inherits Casa(1000000, rocaCasterly){
	                        //PATRIMONIO, CIUDAD
	method permiteCasamientoDe(unPersonaje){
		return unPersonaje.estaSinPareja()
	}
	
	method permiteCasamientoCon(unaPareja){
		return true
	}
}

object stark inherits Casa(5000000, norteDePoniente){
	
	override method esStark(){
		return true
	}
	
	method permiteCasamientoDe(unPersonaje){
		return true
	}
	
	method permiteCasamientoCon(unaPareja){
		return !unaPareja.esDeStark()
	}
}

object guardiaDeLaNoche inherits Casa(200, elMuro){
	
	method permiteCasamientoDe(unPersonaje){
		return false
	}
	
	method permiteCasamientoCon(unaPareja){
		return false
	}
}