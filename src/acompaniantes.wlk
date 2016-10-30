class Acompaniante{
	method patrimonio(){
		return 0
	}
}

class Dragon inherits Acompaniante{
	method esPeligroso(){
		return true
	}
}

class Lobo inherits Acompaniante{
	method esPeligroso(){
		return false
	}
}

class LoboHuargo inherits Lobo{
	override method esPeligroso(){
		return true
	}
}