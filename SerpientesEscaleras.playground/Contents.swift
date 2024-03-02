import Foundation

var sumaDados:Int = 0
repeat {
    var acumulado:[Int] = []
    var dado = Int.random(in: 1...6)
//    print(dado)
    acumulado.append(dado)

    for number in acumulado {
        sumaDados += number
    }
    
    print(sumaDados)

    switch sumaDados {
    case sumaDados where sumaDados == 1:
        print("Avanza a la casilla 1")
    case sumaDados where sumaDados == 2:
        print("Subes a la casilla 10")
    case sumaDados where sumaDados == 3:
        print("Avanza a la casilla 3")
    case sumaDados where sumaDados == 4:
        print("Avanza a la casilla 4")
    case sumaDados where sumaDados == 5:
        print("Avanza a la casilla 5")
    case sumaDados where sumaDados == 6:
        print("Avanza a la casilla 6")
    case sumaDados where sumaDados == 7:
        print("Avanza a la casilla 7")
    case sumaDados where sumaDados == 8:
        print("Avanza a la casilla 17")
    case sumaDados where sumaDados == 9:
        print("Avanza a la casilla 11")
    case sumaDados where sumaDados == 10:
        print("Avanza a la casilla 10")
    case sumaDados where sumaDados == 11:
        print("Avanza a la casilla 11")
    case sumaDados where sumaDados == 12:
        print("Avanza a la casilla 12")
    case sumaDados where sumaDados == 13:
        print("Regresa a la casilla 3")
    case sumaDados where sumaDados == 14:
        print("Avanza a la casilla 14")
    case sumaDados where sumaDados == 15:
        print("Avanza a la casilla 15")
    case sumaDados where sumaDados == 16:
        print("Avanza a la casilla 16")
    case sumaDados where sumaDados == 17:
        print("Avanza a la casilla 17")
    case sumaDados where sumaDados == 18:
        print("Avanza a la casilla 7")
    case sumaDados where sumaDados == 19:
        print("Avanza a la casilla 19")
    case sumaDados where sumaDados == 20:
        print("Avanza a la casilla 20")
    case sumaDados where sumaDados == 21:
        print("Avanza a la casilla 10")
    case sumaDados where sumaDados == 22:
        print("Avanza a la casilla 22")
    case sumaDados where sumaDados == 23:
        print("Avanza a la casilla 15")
    case sumaDados where sumaDados == 24:
        print("GANASTE!!!")
    default: print("desconocido")
    }
} while sumaDados <= 24
