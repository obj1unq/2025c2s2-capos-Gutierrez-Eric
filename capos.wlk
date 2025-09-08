object rolando {
    var hogar = castilloDePiedra
    var tamañoMochila = 2
    const mochila = #{}
    const ordenEncuentra = []
    var poderBase = 5
    const moradasConquistadas = #{}

    method esPoderoso (){

    }
  
    method enemigosQuePuedeDerrotar(enemigos){
        return enemigos.filter({enemigo => enemigo.puedeSerVencidoPor(self)})
    }

    method tierrasQuePuedeConquistar(tierraErethia){
        return (self.enemigosQuePuedeDerrotar(tierraErethia.listaEnemigos())).map({enemigo => enemigo.hogar()})

}

    method moradasConquistadas (){
        return moradasConquistadas
    }

    method conquistarFortaleza(enemigo){
        moradasConquistadas.add(enemigo.hogar())
    }
    
    method puedeCombatir(enemigo){
        return (self.poderTotal() > enemigo.poder())
    }

    method batallar(){ 
        mochila.forEach({artefacto => artefacto.sumarUso()})
        poderBase = poderBase + 1
    }

    method poderBase(){
        return poderBase
    }

    method poderBase (_poderBase){
        poderBase = _poderBase
    }

    method sumatoriaPoderArtefactos(){
        return mochila.sum({artefacto => artefacto.poderPara(self)})
    }

    method poderTotal(){
        return (poderBase + self.sumatoriaPoderArtefactos())
    }

    method recolectar(artefacto){
        ordenEncuentra.add(artefacto)
        if(mochila.size() < tamañoMochila){
            mochila.add(artefacto)
        }
    }

    method artefactoConMasPoder(){
        return hogar.almacen().map({artefacto => artefacto.poderBase()}).max()
    }

    method ordenEncuentra(){
        return ordenEncuentra
    }

    method artefactos(){
        return mochila
    }
    method nuevoTamañoMochila(_tamañoMochila){
        tamañoMochila = _tamañoMochila
    }
    method llegaAlHogar(){
        hogar.almacenarArtefactos(mochila)
        mochila.clear()
    }
    method poseciones(){
            return mochila.union(hogar.almacen())
    }

    method poseeArtefacto(artefacto){
        return (self.poseciones()).contains(artefacto)
    }

}

object castilloDePiedra {
    const almacen =#{}

    method almacenarArtefactos (artefactos){
        almacen.addAll(artefactos)
    }

    method almacen(){
        return almacen
    }
}

object espadaDelDestino{
    var usos = 0
    const poderBase = 7
    method poderPara(personaje){
       if(usos == 0){
        return personaje.poderBase()
       } else {
        return personaje.poderBase()/2
       }
    }

    method poderBase(){
        return poderBase
    }
    method sumarUso(){
        usos = usos + 1
    }
}

object libroDeHechizos {
    const poderes = []
    var usos = 0
    method poderPara(personaje){
       if(poderes.size() > 0){
        return (poderes.first().poderAporta(personaje))
       } else {
        return 0
       }
    }

    method poderes(_poderes){
        poderes.add(_poderes)
    }

    method poderes(){
        return poderes
    }
    method sumarUso(){
        usos = usos +1
        poderes.remove(poderes.first())
    }
}

object bendicion {

    method poderAporta(personaje){
        return 4
    }
}

object invisibilidad {

    method poderAporta(personaje){
        return personaje.poderBase()
    }
}

object invocacion {

    method poderAporta(personaje){
        return personaje.artefactoConMasPoder()
    }

}
object collarDivino {
    const poderBase = 3
    var usos = 0
    
    method poderPara(personaje){
        if(personaje.poderBase() < 6){
            return poderBase
        }else {
            return poderBase + usos
        }
    }

    method poderBase(){
        return poderBase
    }
    method sumarUso(){
        usos = usos + 1
    }
}

object armaduraDeAceroValyrio {
    const poderBase = 6
    var usos = 0
    method poderPara(personaje){
        return poderBase
    }
    method sumarUso(){
        usos = usos + 1
    }

    method poderBase(){
        return poderBase
    }
}

object caterina {
    const hogar = fortalezaDeAcero

    method hogar(){
        return hogar
    }
    method poder(){
        return 28
    }
    method puedeSerVencidoPor(personaje){
      return personaje.poderTotal() > self.poder()
    }
}

object archibaldo {
    const hogar  = palacioDeMarmol

    method hogar(){
        return hogar
    }

    method poder(){
        return 16
    }

    method puedeSerVencidoPor(personaje){
         return personaje.poderTotal() > self.poder()
    }
}

object astra {
    const hogar = torreDeMarfil

    method hogar(){
        return hogar
    }
    
    method poder(){
        return 14
    }
    method puedeSerVencidoPor(personaje){
        return personaje.poderTotal() > self.poder()
    }
}

object torreDeMarfil{

}

object palacioDeMarmol{

}

object fortalezaDeAcero {

}

object tierraErethia {
    const listaEnemigos = [caterina,archibaldo,astra]

    method listaEnemigos(){
        return listaEnemigos
    }
    method agregarEnemigo(enemigo){
        listaEnemigos.add(enemigo)
    }

    method primerEnemigo(){
        return listaEnemigos.first()
    }
    method removerEnemigo(){
        listaEnemigos.remove(self.primerEnemigo())
    }
    method cantidadEnemigos(){
        return listaEnemigos.size()
    }

    method dominiosDeEnemigos(){
        return listaEnemigos.map({enemigo => enemigo.hogar()})
    }
}