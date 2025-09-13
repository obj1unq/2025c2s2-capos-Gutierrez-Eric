object rolando {
    const tamañoMochila = 2
    const mochila =[]

    method recolectar(artefacto){
        if(self.cantArtefactos() < tamañoMochila){
            mochila.add(artefacto)
        }
    }
    method cantArtefactos(){
        return mochila.size()
    }
    method artefactos(){
        return mochila
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