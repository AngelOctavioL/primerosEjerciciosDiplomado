import Foundation

// Generics
// los genericos usualmente usa los picoparentesis <>

let array: [Int] = []
let array2 = [Int]()
let array3 = Array<Int>()
let array4 = Array<String>()

//stack
//last in / first out
// push -> agregar elemento
// pop -> sacar elemento

struct Stack {
    var items = [Int]()
    
    mutating func push(_ newItem: Int) {
        items.append(newItem)
    }
    
    mutating func pop() -> Int? {
        guard !items.isEmpty else {
            return nil
        }
        
        return items.removeLast()
    }
}

var intStack = Stack()
intStack.push(1) // [1}
intStack.push(2) // [1,2]

print(intStack.pop())
print(intStack.pop())
print(intStack.pop())

// usando genericos
struct StackWithElement<Element> {
    var items = [Element]()
    
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        
        return items.removeLast()
    }
    
    func map<U>(_ transformer: (Element) -> U) -> StackWithElement<U> {
        var mappedItems = [U]()
        
        for item in items {
            let transformedItem = transformer(item)
            mappedItems.append(transformedItem)
        }
        
        return StackWithElement<U>(items: mappedItems)
    }
}

var intStackElement = StackWithElement<Int>()
intStackElement.push(1)
print(intStackElement)

var intStackElementString = StackWithElement<String>()
intStackElementString.push("a")
print(intStackElementString)

var intStackElementInt = StackWithElement<Int>()
intStackElementInt.push(1)
intStackElementInt.push(2)
intStackElementInt.push(5)
print(intStackElementInt)

let stringStackMap = intStackElementInt.map{someInt in "\(someInt)"}
print(stringStackMap)

// map -> itera sobre un arreglo y le aplica una tranformacion a cada elemento
// y devuelve un arreglo del mismo tamaño pero con los elementos transformados

func myMap<T, U>(_ items: [T], _ transformer: (T) -> U) -> [U] {
    var result = [U]()
    
    for item in items {
        let transformedItem = transformer(item)
        result.append(transformedItem)
    }
    
    return result
}

let myStrings = ["one", "two", "three"]
let myStringsLengths = myMap(myStrings) {
    someString in return someString.count
}
print(myStringsLengths)

let myNumbers = [1,2,3]
let myNumbersTransformed = myMap(myNumbers) {
    number in return "\(number)"
}

// Type Constrains
// sirve para validar todo lo que nos esta llegando
func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool {
    return first == second
}

func checkIfDescriptionMatch<T: CustomStringConvertible,
                             U: CustomStringConvertible>(_ first: T, _ second: U) -> Bool {
    first.description == second.description
}

checkIfDescriptionMatch(1, 1)
checkIfDescriptionMatch(1, "1")

struct Car {
    let name: String
    let year: Int
}

extension Car: Equatable {
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.year == rhs.year
    }
}

let myFirstCar = Car(name: "Corolla", year: 2015)
let mySecondCar = Car(name: "Civic", year: 2015)

print(checkIfEqual(myFirstCar, mySecondCar))
