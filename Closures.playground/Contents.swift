import Foundation

// Programacion funcional

// 4 caracteristicas de las funciones puras:
// first-class function -> las funciones que definana el lenguaje se pueda trabjar como cualquier otro tipo de dato en las funciones
// pure function
// inmutability
// strong type


// Map

let volunteerAverages = [10.5, 4.3, 7.6, 8.4, 9.3, 2.1]

let rounderVolunteerAverages = volunteerAverages.map({(average: Double) -> Int in return Int(average)})

print(rounderVolunteerAverages)

// Filter
// itera sobre un arreglo y nos devuekve un arreglo del mismo tipo pero puede ser de un tamaño menor
let invotedVolunteers = volunteerAverages.filter({(average: Double) -> Bool in return average > 5.0})
print(invotedVolunteers)

// Reduce
// Itera sobre un arreglo y nos devuelve un único valor significativo del arreglo
let totalVolunteers = volunteerAverages.reduce(5) {
    partialResult, average in return partialResult + average
}

print(totalVolunteers)
// https://classroom.github.com/a/Xs0qwCNZ
