class Rutina {
    const actividad

    method calorias(tiempo) {
        return actividad.calorias(tiempo)
    }

    //Ahora Rutina queda libre para preocuparse por otras cosas que no tengan que ver con la actividad
}

class Actividad {
    
    method calorias(tiempo) {
        return 100 * (tiempo - self.descanso(tiempo)) * self.intensidad()
    }
    method intensidad()
    method descanso(tiempo)
}

class Running inherits Actividad {
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

class Remo inherits Actividad {
    
    override method descanso(tiempo) {
        return tiempo / 5
    }

}

object remo inherits Remo {
    override method intensidad() {
        return 1.3
    }
}

object remoCompeticion inherits Remo {
    override method intensidad() {
        return 1.7
    }

    override method descanso(tiempo) {
        return (super(tiempo) - 3).max(2)
    }
}
