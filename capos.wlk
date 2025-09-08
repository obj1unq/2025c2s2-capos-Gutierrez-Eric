object rolando {
    var tamañoMochila = 2
    const mochila = []
    const ordenEncuentra = []

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
        castilloDePiedra.almacenarArtefactos(mochila)
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
        artefactos.forEach({artefacto => almacen.add(artefacto)})
    }
    method almacen(){
        return almacen
    }
}



object espadaDelDestino{

}

object libroDeHechizos {

}

object collarDivino {

}

object armaduraDeAceroValyrio {

}