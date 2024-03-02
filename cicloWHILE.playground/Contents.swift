import Foundation

print("WHILE")
// Primero evalua y luego ejecuta
var counter = 1

while counter < 10 {
    print(counter)
    counter += 1
}

counter = 0
while 1...5 ~= counter {
    print(counter)
    counter += 1
}

print("REPEAT WHILE")
// Primero ejecuta y luego evalua
repeat {
    print(counter)
    counter += 1
} while 1...5 ~= counter
