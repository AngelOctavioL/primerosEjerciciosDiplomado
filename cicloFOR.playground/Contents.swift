import Foundation

for index in 1...5 {
    print(index)
}

let numbers = [1,2,5,7]
for number in numbers {
    print(number)
}

let intervalsUpToLast = stride(from: 0, to: 20, by: 5)
for number in intervalsUpToLast {
    print(number)
}

let intervalsThroughLast = stride(from: 0, through: 20, by: 5)
for number in intervalsThroughLast {
    print(number)
}

// Diccionario con pokemons
let pokemon = ["Fire":"Charmander", "Water": "Mudkip", "Grass": "Turtwig", "Electric": "Pikachu"]

for (type, name) in pokemon {
    print("I like \(name) which is \(type) type")
}

for poke in pokemon {
    print("I like \(poke.value) which is \(poke.key) type")
}

let names: Set = ["Dean", "Sam", "Bobby", "Ellen"]

var index = 0
for _ in names {
    print(index)
    index += 1
}

// enumarated mapea names para que sea una tupla y se pueda hacer el for
for (index, name) in names.enumerated() {
    print("\(name) is number \(index)")
}

for (index, (type, name)) in pokemon.enumerated() {
    print("\(index), \(type) \(name)")
}

for (index, poke) in pokemon.enumerated() {
    print("\(index), \(poke.key) \(poke.value)")
}

for (index, name) in names.enumerated() {
    if index % 2 == 0 {
        print("\(name) is \(index)")
    }
}

for (index, name) in names.enumerated() {
    if index % 2 == 0 {
        continue
    } else {
        print(index)
    }
}

for poke in pokemon where poke.key == "Grass" {
    print(poke.value)
}

let deCeroASesenta = stride(from: 0, through: 60, by: 15)
for number in deCeroASesenta {
    print(number)
}
