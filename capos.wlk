object rolando {
    var hogar = castilloDePiedra
    var tamañoMochila = 2
    const mochila = []
    const ordenEncuentra = []
    var poderBase = 5
    

    method batallar(){ //REVISAR
        poderBase = poderBase + 1
    }

    method poderBase (_poderBase){
        poderBase = _poderBase
    }

    method sumatorioPoderArtefactos(){
        mochila.sum({artefacto => artefacto.poderPara(self)})
    }

    method poderTotal(){
        return poderBase + 5
    }

    method recolectar(artefacto){
        ordenEncuentra.add(artefacto)
        if(self.cantArtefactos() < tamañoMochila){
            mochila.add(artefacto)
        }
    }

    method ordenEncuentra(){
        return ordenEncuentra
    }

    method cantArtefactos(){
        return mochila.size()
    }
    method artefactos(){
        return mochila
    }
    method nuevoTamañoMochila(_tamañoMochila){
        tamañoMochila = _tamañoMochila
    }
    method llegaAlCastillo(){
        hogar.almacenarArtefactos(mochila)
        mochila.clear()
    }
    method poseciones(){
            return mochila + (castilloDePiedra.almacen())
    }

    method poseeArtefacto(artefacto){
        return (self.poseciones()).contains(artefacto)
    }

}

object castilloDePiedra {
    const almacen =[]

    method almacenarArtefactos (artefactos){
        almacen.addAll(artefactos)
    }

    method almacen(){
        return almacen
    }
}

///REVISAR

object espadaDelDestino{
    var usos = 0
    method poderPara(personaje){
       if(usos == 0){
        return personaje.poderBase()
       } else {
        return personaje.poderBase()/2
       }
    }
}

object libroDeHechizos {

}

object collarDivino {
    const poderBase = 3
    var usos = 0
    method poderPara(personaje){

    }
}

object armaduraDeAceroValyrio {
    const poderBase = 6
    method poderPara(personaje){
        return poderBase
    }
}