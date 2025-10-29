class Rutina {
    method calorias(tiempo) {
     return 100 * (tiempo - self.descanso(tiempo)) * self.intensidad()
    }
    method descanso(tiempo)
    method intensidad()
}

class Running inherits Rutina {
    const property intensidad
    override method descanso(tiempo) {
        return if (tiempo > 20) 5 else 2
    }
}
class Maraton inherits Running {
    override method calorias(tiempo) {
        return super(tiempo) * 2
    }
}

class Remo inherits Rutina {
    override method intensidad() {
        return 1.3
    }
    override method descanso(tiempo) {
        return tiempo / 5
    }
}

class RemoCompeticion inherits Remo {
    
    override method intensidad() {
        return 1.7
    }
    override method descanso(tiempo) {
        return (super(tiempo) - 3).max(2)
    }
}

class Persona {
    
    var property peso

    method practicar(rutina) {
        self.validarPracticar(rutina)
        peso = peso - self.kilosQueBaja(rutina)
    }

    method validarPracticar(rutina) {
        if (not self.puedePracticar(rutina)) {
            self.error("No se puede practicar " + rutina)
        }
    }


    method kilosQueBaja(rutina) {
        // Aca hice un method calorias en lugar de llamar directamente a rutina.calorias(self.tiempo()) 
        // porque esa porcion de codigo la necesito reutilizar 
        return self.calorias(rutina) / self.kilosPorCaloria()
    }

    method calorias(rutina) {
        return rutina.calorias(self.tiempo())
    }

    method puedePracticar(rutina) 
    method tiempo()
    method kilosPorCaloria()

}

class Sedentaria inherits Persona {

    const property tiempo

    override method puedePracticar(rutina) {
        return self.peso() > 50
    }

    override method kilosPorCaloria() {
        return 7000
    }

}
class Atleta inherits Persona {

    override method kilosQueBaja(rutina) {
        return super(rutina) - 1
    }

    override method tiempo() {
        return 90
    }

    override method puedePracticar(rutina) {
        return self.calorias(rutina) > 10000
    }

    override method kilosPorCaloria() {
        return 8000
    }

}

class Predio {
    const property rutinas

    method calorias(persona) {
        return rutinas.sum({rutina => persona.calorias(rutina)})
    }
    method esTranqui(persona) {
        return rutinas.any({rutina => persona.calorias(rutina) < 500})
    }
    method rutinaMasExigente(persona) {
        return rutinas.max({rutina => persona.calorias(rutina)})
    }
}
class Club {
    const property predios

    method mejorPredio(persona) {
        return predios.max({predio => predio.calorias(persona)})
    }
    method prediosTranquis(persona) {
        return predios.filter({predio => predio.esTranqui(persona)})
    }
    method rutinasMasExigentes(persona) {
        return predios.map({predio => predio.rutinaMasExigente(persona)}).asSet()
    }
}