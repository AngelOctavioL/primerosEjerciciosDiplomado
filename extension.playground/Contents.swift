import Foundation

// Extensiones

// Can be used to:
//- add computed properties
//- add new initializers
//- add protocol conformance
//- add new methods
//- add embedded types

// Double -> Squared

extension Double {
    var squared: Double{ self * self}
}

let sideLength: Double = 2.0
let squeredOne = sideLength * sideLength
print(squeredOne)
let squaredTwo = sideLength.squared
print(squaredTwo)

// Las propiedades de una estructuras son inmutables
// es decir no puedes cambiar sus valores ellas mismas
// son estaticas
struct Car {
    let maker: String
    let model: String
    let year: Int
    // la precondicion se debe cumplir para que el programa se ejecute
    // si la precondicion no se cumple lanza un error
    // la precondition no esta amarrada al willSet se puede usar sola
    var fuelLevel: Double {
        // willSet antes de asignar el valor a la variable  primero revisa la asignacion
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1")
        }
    }
}

// Cuando se extiende se lleva tambien los niveles de acceso de las variables
// osea si una variable es privada en la extension tambien sera privada
extension Car: CustomStringConvertible {
    var description: String {
        return "My car is: \(maker) - \(model) "
    }
}

// Mark - Create new initializer
extension Car {
    // init es un inicializador
    // al hacer una inicializador en una extension no perdemos el original que ya viene
    // dentro de la estructura original
    init(maker: String, model: String, year: Int) {
        self.init(maker: maker, model: model, year: year, fuelLevel: 1)
    }
}

// Mark - Nested types
extension Car {
    enum Era {
        case modern, vintage, veteran
    }
    
    var era: Era {
        let era: Era
        switch year {
        case ...1896:
            era = .veteran
        case 1897...1919:
            era = .vintage
        default:
            era = .modern
        }
        return era
    }
}

// Mark - add new method
// Con mutating podemos modificar los propiedades
extension Car {
    mutating func emptyFuel(by amount: Double) {
        precondition(amount <= 1 && amount >= 0, "Amount to remove must be between 0 and 1")
        fuelLevel -= amount
    }
    
    mutating func fillFuel() {
        fuelLevel = 1.0
    }
}

let fistCar = Car(maker: "Honda", model: "Civic", year: 2017, fuelLevel: 1)
print(fistCar)
print(fistCar.era)


// Ejercicio 1 convirtiendo a extension
//extension Department: CustomStringConvertible {
//    var description: String {
//        return "Department: \(name)"
//    }
//}

// Ejercicio 2 extendiendo el tipo de dato Int
//extension Int {
//    var isEven: Bool {
//        self.isMultiple(of: 2) ? true : false
//    }
//    
//    var isOdd: Bool {
//        !self.isMultiple(of: 2) ? true : false
//    }
//}
