import UIKit

enum Messeges: String {
    case correctPass = "Ключь подошел. Двигатель запущен."
    case incorrectPass = "Ключь не подходит. Для старта двс вставте ключ от этого автомобиля."
}
enum noPlasce: String, Error {
    case noPl
    case plasceOnly
    case outOfRange
    case noValue
}

struct Vechicles {
    let startKey: Int
    let plInside: Int
    var pepopleInside: Int
    
    mutating func startEnKey(key: Int) {
        
        guard key == startKey else {
            return print(Messeges.incorrectPass.rawValue)
        }
        return print(Messeges.correctPass.rawValue)
    }
    
    mutating func checkPlaceInside(countP: Int) -> Int{
        
        let place = plInside - pepopleInside
        var erNum = 0
        if countP != 0 && countP <= place {
            pepopleInside += countP
             erNum = 2
        } else if countP != 0 && countP > place {
            erNum = 3
        } else if countP == 0 {
            erNum = 4
        } else {
            erNum = 1
        }
        return erNum
    }
    
    mutating func checkEr(num: Int) throws {
        
        switch num {
        case 1:
            throw noPlasce.noPl
        case 2:
            throw noPlasce.plasceOnly
        case 3:
            throw noPlasce.outOfRange
        case 4:
            throw noPlasce.noValue
        default:
            break
        }
    }
    
    mutating func insertPeopele(num: Int) {
        
        let erNum = checkPlaceInside(countP: num)
        
        do {
            try checkEr(num: erNum)
        } catch {
            let error = error as! noPlasce
            switch error {
            case .noPl:
                print("В машине нет свободых мест")
            case .plasceOnly:
                print("В машину село \(pepopleInside) чел. осталось мест: \(plInside - pepopleInside)")
            case .outOfRange:
                print("Машина не предназначена для такого кол-ва пассажиров")
            case .noValue:
                print("Укажите пожалуйста кол-во пассажиров !!!")
            }
        }
    }
    
    mutating func peopleOut (numP: Int) {
        if numP > 0 && numP <= pepopleInside {
            pepopleInside -= numP
            print("В машине занято \(pepopleInside)м. Вышло \(numP)чел.")
        } else {
            print("В машине находится \(pepopleInside) чел., сколько вы хотите высадить?")
        }
    }
}

var car2 = Vechicles(startKey: 1234, plInside: 4, pepopleInside: 0)
car2.startEnKey(key: 12)
car2.startEnKey(key: 1234)
car2.insertPeopele(num: 3)
car2.peopleOut(numP: 5)
car2.peopleOut(numP: 2)





