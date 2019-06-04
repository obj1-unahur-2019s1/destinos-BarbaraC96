class Viajes {
	var property idioma = #{}
	method idiomas(idio) { idioma.add(idio) }
	method idiomasDeLosViajes() { return idioma }
	//method implicaEsfuerzo() {}
	//method sirveParaBroncearse() {}
	//method cuantosDiasLlevaLaAct() {}
	method esInteresante() { return idioma.size() > 1 }
}
 
class ViajeAlaPlaya inherits Viajes {
	var property largo = 0
	
	method largo(metros) { largo = metros/500 }
	method cuantosDiasLlevaLaAct() { return largo }
	method implicaEsfuerzo() { return largo > 1200 } 
    method sirveParaBroncearse() { return true }
} 

class ExcursionAciudad inherits Viajes {
	var property cantidadDeAtracciones = 0
	
	method dias(cant) { cantidadDeAtracciones = cant/2 } 
	method cuantosDiasLlevaLaAct() { return cantidadDeAtracciones }
	method implicaEsfuerzo() { return cantidadDeAtracciones.between(5,8)}
	method sirveParaBroncearse() { return false  } 
	override method esInteresante() { return super() and cantidadDeAtracciones==5 }
}

class ExcursionAciudadTropical inherits ExcursionAciudad {
	override method cuantosDiasLlevaLaAct() { 
		return super() + 1
	}
	override method sirveParaBroncearse() { return true } 
}

class SalidaDeTrekking inherits Viajes {
	var kilometrosDeSendero = 0
	var diasDeSol = 0
	
	method dias(cant) { kilometrosDeSendero = cant/50 }
	method cuantosDiasLlevaLaAct() { return kilometrosDeSendero } 
	method implicaEsfuerzo() { return kilometrosDeSendero>80 }
	method sirveParaBroncearse() { return diasDeSol>200 or diasDeSol.between(100,200)
		 and (kilometrosDeSendero>120) }
	override method esInteresante() { return super() and diasDeSol>140 }
	
}	

class ClasesDeGym inherits Viajes {  
     
     method cuantosDiasLlevaLaAct() { return 1 }
     method implicaEsfuerzo() { return true }
     method sirveParaBroncearse() { return false }
     method idiomas() { idioma.find({i => i == "español"}) } 
	
}

class Socios {
	var property actividadesRealizadas = []
	var property maxDeActividades = 0
	const property edad = 0
	const property idiomaHablado = []
	
	method esAdoradorDelSol() { actividadesRealizadas.all ({a => a.sirveParaBroncearse()})}
	
	method actividadesEsforzadas() { actividadesRealizadas.count({a => a.implicaEsfuerzo()})}
	
	method realizaUnaActividad(act) { actividadesRealizadas.add(act)
	  return if (actividadesRealizadas==maxDeActividades) {"error"} else {}
	}
	
	
}