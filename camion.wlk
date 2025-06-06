import cosas.*
// parte 1

object camion {
const carga = []

method cargaDelCamion() = carga
method cargar(unaCosa){
    carga.add(unaCosa)
}

method descargar(unaCosa){
    carga.remove(unaCosa)
}
method pesoTotalDelCamion() = carga.sum({c => c.peso()}) + 1000

method pesoDeLasCosasCargadasEsNumeroPar() = carga.all({c => c.peso() %2 == 0})

method hayAlgunaCosaQuepesa(unPeso) = carga.any({c => c.peso() == unPeso})

method obtenerLaPrimeraCosaCargadaConNivelDePeligrosidad(unNivel) = carga.findOrDefault({c => c.peligrosidad() == unNivel}, null)

method obtenerTodasLasCosasConNivelDePeligrosidad(unNivel) = carga.filter({c => c.nivelDePeligrosidad() > unNivel})

method cosasQueSuperanLaPeligrosidadDe(unaCosa) = self.obtenerTodasLasCosasConNivelDePeligrosidad(unaCosa.nivelDePeligrosidad())

method elCamionEstaExedidoDePesoMaximo() = self.pesoTotalDelCamion() > 2500

method elCamionPuedeCircularEnLaRuta(unNivel) = not self.elCamionEstaExedidoDePesoMaximo() and self.obtenerLaPrimeraCosaCargadaConNivelDePeligrosidad(unNivel) == null

method cosaMasPesadaQueTieneCargada() = carga.max({c => c.peso()}) 

method cosaMasLivianaQueTieneCargada() = carga.min({c => c.peso()})

method tieneUnaCosaQuePesa(unValor) = unValor.between(self.cosaMasLivianaQueTieneCargada(), self.cosaMasPesadaQueTieneCargada())

}