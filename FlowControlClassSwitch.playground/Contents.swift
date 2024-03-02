import Foundation

var animal = "dog"

switch animal {
    // casos compuestos es cuando pones varias opciones en un case
case "dog", "cat": print("it´s a common pet")
case "mouse": print("it´s a mouse")
default: break
}

// Tener cuidado por que el orden importa en este casi el 9 aparece en dos lugares
// entonces se imprimira el primero que encuentre
var grade = 9
switch grade {
case ...5: print("Failed")
case 6...9: print("Nice")
case 9: print("Great!")
case 10...: print("WOW")
default: break
}

let color = (255, 255, 255)
switch color {
case (_, _, 255): print("max blue")
case (_, 255, _): print("max green")
case (255, _, _): print("max red")
default: print("random color")
}

let colorDos = (255, 255, 255)
switch colorDos {
//    las variables declaras dentro del case solo viven dentro del case
case let (r, g, 255):
    print("max blue, g: \(g), r: \(r)")
case (let a, 255, let c):
    print("max green, a: \(a), c: \(c) ")
case (255, _, _): print("max red")
default: print("random color")
}

let colorTres = (255, 255, 255)
switch colorTres {
//    las variables declaras dentro del case solo viven dentro del case
//    Se le puede hacer una validacion extra con el where
case let (r, g, 255) where r < 255:
    print("max blue, g: \(g), r: \(r)")
case (let a, 255, let c):
    print("max green, a: \(a), c: \(c) ")
case (255, _, _): print("max red")
default: print("random color")
}

// problema de los cuadrantes
var coordenadaX:Double = 2.3456
var coordenadaY:Double = 5.2345

let coordenada = (coordenadaX, coordenadaY)

//switch coordenada {
//case let(valueX, valueY):
//    if valueX > 0 && valueY > 0 {
//     print("La coordenada esta en el cuadrante 1")
//    } else if valueX < 0 && valueY < 0 {
//        print("La coordenada esta en el cuadrante 3")
//    } else if valueX > 0 && valueY < 0 {
//        print("La coordenada esta en el cuadrante 4")
//    } else if valueX < 0 && valueY > 0 {
//        print("La coordenada esta en el cuadrante 2")
//    } else if valueX == 0 && valueY == 0 {
//        print("El cuadrante esta en el origen")
//    }
//}

switch coordenada {
case let(valueX, valueY) where valueX > 0 && valueY > 0:
    print("La coordenada esta en el cuadrante 1")
case let(valueX, valueY) where valueX < 0 && valueY < 0:
    print("La coordenada esta en el cuadrante 3")
case let(valueX, valueY) where valueX > 0 && valueY < 0:
    print("La coordenada esta en el cuadrante 4")
case let(valueX, valueY) where valueX < 0 && valueY > 0:
    print("La coordenada esta en el cuadrante 2")
case let(valueX, valueY) where valueX == 0 && valueY == 0:
    print("La coordenada esta en el origen")
default: print("cuadrante desconocido")
}

