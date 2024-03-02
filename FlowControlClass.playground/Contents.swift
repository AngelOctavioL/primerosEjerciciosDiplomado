import Foundation

var animal = "dog"

if animal == "dog" {
    print("it's a 🐶")
} else {
    print("it´s another animal")
}

if animal != "dog" {
    print("it´s another animal")
} else {
    print("it´s a 🐶")
}

if !(animal == "dog") {
    print("it´s anbither animal")
} else {
    print("it´s a 🐶")
}

//animal = "perrot"
if animal.count < 4 {
    print("less than 4 letters")
} else {
    print("too many 🙈")
}

if animal == "dog" || animal == "cat" {
    print("common pet")
} else {
    print("what is it?!")
}

var number = 2

if animal == "cat" {
    print("it´s a cat!!!!")
} else if number == 2 {
    print("number 2")
} else {
    print("unrelated")
}

if animal == "cat" {
    print("it´s a cat")
}
if number == 2 {
    print("number 2")
}

if #available(iOS 16.6, *) {
    // Lo que se escriba aqui es solo si cumple con la version de iOS 16.6
} else {
    // codigo para sistemas operativos anteriores a la 16.6
}

if #unavailable(iOS 16.6) {
    // código para SO anterior a la 16.6
}

// Operador ternario
number == 2 ? print("este seria el if") : print("este seria el else")

var value = number == 2 ? "number 2" : "others"

// el ternario de arriba es igual a
var exampleValue = ""
if number == 2 {
    exampleValue = "number"
} else {
    exampleValue = "others"
}

var weather = "nieve"
var time = 6

if weather == "nieve" {
    print("🌨️")
} else if weather == "lluvia" {
    print("🌧️")
}

// Solucion 1
if time == 7 || time == 8 || time == 9 || time == 10 || time == 11 || time == 12 || time == 13 || time == 14 || time == 15 || time == 16 || time == 16 || time == 18 {
    print("Usa bloqueador")
} else if time == 19 || time == 20 || time == 21 || time == 22 || time == 23 || time == 0 || time == 1 || time == 2 || time == 3 || time == 4 || time == 5 || time == 6 {
    print("No necesita bloqueador")
}

// Solucion 2
if time >= 7 && time <= 18 {
    print("bloqueador")
} else if time >= 19 && time <= 23 || time >= 0 && time <= 6 {
    print("No bloqueador")
}

// Solucion 3
let bloqueador = time >= 7 && time <= 18 ? "usa bloqueador 2" : "No usar bloqueador 2"
print(bloqueador)

// solucion 4
var dark = Array(0...6) + Array(19...23)
var light = 7...18

if light ~= time {
    print("bloqueador")
} else {
    print("No bloqueador")
}

