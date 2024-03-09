import Foundation

// Clousures

func sort(_ lhs: Int, _ rhs:Int) -> Bool {
    return lhs < rhs
}

let someArray: [Int] = [2, 5, 6, 3]
let sortedArray = someArray.sorted(by: sort)
print(sortedArray)

// Clousure forma abreviada
let sortedArray2 = someArray.sorted(by: { (lhs: Int, rhs: Int) -> Bool in
    return lhs < rhs
})

print(sortedArray2)

// Funcion que recibe otra funcion
func runClosureNTimes(_ N: Int, closure: () -> ()) {
    for time in 0..<N {
        closure()
    }
}

runClosureNTimes(3, closure: {
    print("Hola Mundo")
})

// Otro ejemplo
func runClosure(closure: (String) -> ()) {
    let names = ["a", "b", "c"]
    for name in names {
        closure(name)
    }
}

runClosure(closure: {
    name in print(name)
})

// Protocolos - Los protocolos son un contrato que dice que es lo que se debe de cumplir

protocol Paintable {
    var paintColor: String { get }
}

// CustomStringConvertible
// - var description: String
struct Car: CustomStringConvertible {
    var name: String
    
//    el protocolo CustomStringConvertible obliga a que la funcion siempre tenga
//    la variable description
    var description: String {
        "My name is: \(name)"
    }
}

// print
let myCar = Car(name: "civic")

print(myCar)

// Secuence -> pide que se tenga la variable next
// Equeatable -> debe de existir una igualdad ==

struct CarDos: CustomStringConvertible, Equatable, Paintable {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    var description: String {
        "My name is: \(name)"
    }
    
    var paintColor: String { "red" }
    
    static func == (lhs: CarDos, rhs: CarDos) -> Bool {
        return lhs.name == rhs.name
    }
}

struct Bus: Paintable {
    var paintColor: String { "yellow" }
}

let myBus = Bus()
let myCarDos = CarDos(name: "honda")
let paintForSomething: Paintable = myCarDos
print(paintForSomething.paintColor)
let paintForSomethingBus: Paintable = myBus
print(paintForSomethingBus.paintColor)

// Repaso de Clases

class Vehicle {
//    propiedades almacenadas (osea que va a guardar un dato)
    let brand: String
//    El opcional puede o no tener un tipo de dato (se declara con un ?)
//    Su valor inicial sera nil
    var wheels: Int?
    
//    los observadores solo pueden estar en las variables almacenadas y detectan cambios en el valor que van a almacenar
    var owner: String? {
        // observadores antes del cambio -> wiilSet | despues del cambio -> didSet
        willSet(newOwner) {
            print("current value is \(owner)) new value is \(newOwner))")
        } // default es var newValue
        didSet {
            print("current value is \(owner)) old value was \(oldValue))")
        }
    }
//    Propiedades computadas tienen directamente las llaves se llaman computadas por que no tienen la variable en si
//     guardada si no que deben hacer un calcula para asignar o leer
    var type: String {
        // get para lectura. si no se pone explisatamente si es get o set lo toma como get por default
        get {
            if let wheels, wheels > 0 {
                return "land"
            } else {
                return "other"
            }
        }
    }
    
    var registration: String {
        // get para lectura
        get { return owner ?? "no owner" }
        
        // set para escritura
        set { self.owner = newValue }
    }

//    inicializadores -> Es el equivalente a un constructor en otros lenguajes
//    las propiedades opcionales se pueden o no pasaer al constructor
    // El inicializadaror es el unico momento donde le podemos dar un valor al let por que se esta creando
//     Init designado por que le esta dando a cada propiedad lo necesario
    init(brand: String, wheels: Int?) {
        self.brand = brand
        self.wheels = wheels
    }
    
//    En este momento no va a tener todo inicializado pero eventualmente debe terminar como un init designado (inicializado)
    convenience init() {
        self.init(brand: "suzuki", wheels: 4)
    }
    
//    Metodos
    func move() {}
}

var myCarro = Vehicle(brand: "Suzuki", wheels: nil)
print(myCarro.brand)

// Force Unwrapped para sacar el valor de whells se pone ! al final
//myCarro.wheels!

// con if el wheels vive solo dentro del if
if let wheels = myCarro.wheels {
//    wheels es de tipo  INT
//    se ejecuta solo si wheels tiene un valor
}

//Con guardar wheels persiste con guar se usa mas con las funciones por que las funciones retornan cosas
//guard let wheels = myCarro.wheels
//else { fatalError() }

let wheels3 = myCarro.wheels != nil ? myCarro.wheels! : 0

// con el operador nil cohalesing
let wheels2 = myCarro.wheels ?? 0

myCarro.registration
myCarro.registration = "Juan Perez"
print(myCarro.registration)

let yourCar = Vehicle()
// myCar y hisCar estan apuntando a la misma referencia, no son una copio
// por lo tanto cualquier modificacion en una va a afectar a la otra
let hisCar = myCarro
hisCar.owner = "Manuel"
myCarro.owner

// ARC -> automatic reference counting
// va vigilando las referencias para ver como se usan en memoria. Todo eso lo hace automaticamente
// Se recomienda por eso mejor usar struc en lugar de clases

// estructuras
// las estructuras no heredan
// cuando se hacen copias si son independientes una de otra
// no se le debe decir como inicializar

struct Dog {
    var name: String
}

let myDog = Dog(name: "Puppy")

// la unica manera de evitar un inicializador es con una extension
extension Dog {
    init() {
        name = "Chilaquil"
    }
}

var hisDog = myDog
hisDog.name = "Solovino"
print(hisDog.name)
print(myDog.name)

// enumeradores tienen definidos cuales son sus casos concretos
// Este es un bloque finito de tipo Animal
enum Animal {
//    case parrot, cat
    case parrot(name: String)
    case cat(nice: Bool)
    case dog
    
    // todas las pripiedades de los enum son calculadas
    var emoji: String {
//        podemos regresar en general con un return
//        o con un siwtch para cada uno
//        Self <- con mayuscula para el anum en general es decir Animal
//        self <- con minuscula para accder a caso po caso
        switch self {
        case .parrot: return "🦜"
        case .cat: return "🐈"
        default: return "🙊"
        }
    }
}

var myAnimal = Animal.parrot(name: "Paul")
var hisAnimal = Animal.cat(nice: false)
var yourAnimal: Animal = .dog
var hisAnimalDos: Animal = .cat(nice: false)
var theirAnimal: Animal = .cat(nice: true)

switch myAnimal {
case .parrot(let name): print(name)
case .cat(let nice): nice ? print("it's nice") : print("it's mean")
default: break
}

//enum VehicleEnum: Init {
////    estos valores tiene que ser unicos
//    case car = 1
//    case bike = 5
//}
//
//let manusVehicle = VehicleEnum(rawValue: 8)
