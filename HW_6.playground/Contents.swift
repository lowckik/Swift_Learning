import UIKit

// Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
// Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
// *Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct Car {
  var somVal: Int
}

struct Queuen<T> {
    var elemArr: [T] = []
    mutating func queAdd(_ element: T) {
        elemArr.append(element)
    }
    mutating func getFirst() -> T? {
        guard elemArr.count > 0 else {
            return nil
        }
        return elemArr.removeFirst()
    }
    mutating func filter(item: (T) -> Bool) -> [T] {
        return elemArr.filter(item)
    }
    subscript(val: Int) -> T? {
        guard val < elemArr.count && val >= 0 else {
            return nil
        }
        return elemArr[val]
    }
}
var stackCars = Queuen<Car>()

stackCars.queAdd(Car.init(somVal: 1))
stackCars.queAdd(Car.init(somVal: 2))
stackCars.queAdd(Car.init(somVal: 3))
stackCars.queAdd(Car.init(somVal: 4))

print(stackCars)
print(stackCars.getFirst())
print(stackCars.filter { (elemArr) -> Bool in elemArr.somVal % 2 != 0 })
stackCars[2]
