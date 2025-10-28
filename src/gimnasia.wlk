class Rutina {
    method calorias(tiempo)
}

class Running inherits Rutina {
    const intensidad
    override method calorias(tiempo) {
        return 100 * (tiempo - self.descanso(tiempo)) * intensidad
    }
 
    method descanso(tiempo) {
        return if (tiempo > 20) 5 else 2
    }
}
class Maraton inherits Running {
    override method calorias(tiempo) {
        return super(tiempo) * 2
    }
}

class Remo inherits Rutina {
    override method calorias(tiempo) {
        return 100 * (tiempo - self.descanso(tiempo)) * 1.3
    }
 
    method descanso(tiempo) {
        return tiempo / 5
    }
}

class RemoCompeticion inherits Remo {
    
    override method calorias(tiempo) {
        return 100 * (tiempo - self.descanso(tiempo)) * 1.7
    }

    override method descanso(tiempo) {
        return (super(tiempo) - 3).max(2)
    }
}
