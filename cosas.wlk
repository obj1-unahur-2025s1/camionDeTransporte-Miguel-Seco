import camion.*
object knightRider {
  method peso() = 500
  method peligrosidad() = 10
}

object bumblebee {
  var formaActual = auto
  method peso() = 500
  method peligrosidad() = formaActual.peligrosidad()
  method transformar(unaForma) {
    formaActual = unaForma
  }
}

object auto {
  method peligrosidad() = 15
}

object robot {
  method peligrosidad() = 30
}

object paqueteLadrillos {
  var cantLadrillos = 0

  method peso() = cantLadrillos * 2
  method peligrosidad() = 2
  method agregarLadrillos(cant){
    cantLadrillos += cant
  }
  method quitarLadrillos(cant){
    cantLadrillos -= cant
  }
}

object arenaGranel {
  var property peso = 0
  method peligrosidad() = 1
}

object bateriaAntiaerea {
  var estadoBateria = misiles
  method peso() = estadoBateria.peso()
  method peligrosidad() = estadoBateria.peligrosidad()
  method cambiarEstado(unEstado){
    estadoBateria = unEstado
  }
}

object misiles {
  method peso() = 300
  method peligrosidad() = 100
}
object otraCosa {
  method peso() = 200
  method peligrosidad() = 0
}

object contenedorPortuario {
  const cosasAdentro = []

  method agregarCosa(unaCosa){
    cosasAdentro.add(unaCosa)
  }
  method peso()= 100 + cosasAdentro.sum({c => c.peso()})
  method peligrosidad() = if(cosasAdentro.isEmpty()) cosasAdentro.max({c => c.peligrosidad()}) else 0
}

object residuosRadioActivos {
  var property peso = 0
  method peligrosidad() = 200
}

object embalajeDeSeguridad {
  var cosaEmbalada = paqueteLadrillos
  
  method embalar(unaCosa) { cosaEmbalada = unaCosa } 
  method peso() = cosaEmbalada.peso()
  method peligrosidad() = cosaEmbalada.peligrosidad() / 2
}

