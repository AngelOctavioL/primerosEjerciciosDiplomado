import Foundation

func printTable(_ data: [[String]], headings: [String]) {
    var headerRow = "|"
    var columWidths = [Int]()
    
    for heading in headings {
        headerRow += "\(heading) |"
        columWidths.append(heading.count + 2)
    }
    
    print(headerRow)
    
    for row in data {
        var output = "|"
        for (index, item) in row.enumerated() {
            let paddingNeeded = columWidths[index] - item.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            output += "\(padding)\(item)|"
        }
        
        print(output)
    }
}

let data = [
    ["Eva", "38", "6"],
    ["Salem", "40", "18"],
    ["Amit", "50", "20"]
]

//printTable(data, headings: ["Name", "Age", "Vacations Days"])

// Protocolos
protocol TabularDatosSource {
    // get solo lectura set para escribir
    var numberOfRow: Int { get }
    var numberOfColum: Int { get }
    
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, colum:Int) -> String
}

// Estructuras

struct Person {
    let name: String
    let age: Int
    let vacationsDays: Int
}

struct Deparment: TabularDatosSource {
    let name: String
    var people: [Person]
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    var numberOfRow: Int { people.count }
    var numberOfColum: Int { 3 }
    
    func label(forColumn column: Int) -> String {
        let label:String
        switch column {
        case 0: label = "Name"
        case 1: label = "Age"
        case 2: label = "Vacation days"
        default: fatalError("Invalid column")
        }
        return label
    }
    
    func itemFor(row: Int, colum: Int) -> String {
        let person = people[row]
        
        let item: String
        switch colum {
        case 0: item = person.name
        case 1: item = "\(person.age)"
        case 2: item = "\(person.vacationsDays)"
        default: fatalError("Invalid column")
        }
        return item
    }
}

//var deparment = Deparment("Ingenieria", people: [])

func printTable(_ dataSource: TabularDatosSource) {
    var headerRow = "|"
    var columWidths = [Int]()
    
    for columnIndex in 0..<dataSource.numberOfColum {
        let columnLabel = dataSource.label(forColumn: columnIndex)
        let columnHeader = "\(columnLabel)|"
        columWidths.append(columnLabel.count)
        headerRow += columnHeader
    }
    
    print(headerRow)
    
    // for rowIndex in 0..< {}
}
