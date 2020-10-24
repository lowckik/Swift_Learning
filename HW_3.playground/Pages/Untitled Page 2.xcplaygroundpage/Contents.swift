//: [Previous](@previous)

import Foundation

enum Model {
    case ferrary, MAZ, KAMAZ, porche
}

enum TruckAction {
    case load(amount: Int)
    case remove(amount: Int)
}

struct Car {
    var model: Model
    var year: Int
}

struct TruckCar {
    var model: Model
    var year: Int
    var load: Int
    
    mutating func handleLoadAction(action: TruckAction) {
        switch action {
        case .load(amount: let amount):
            self.load += amount
        case .remove(amount: let amount):
            if amount > self.load {
                <#code#>
            }
        default:
            <#code#>
        }
    }
}

//: [Next](@next)
