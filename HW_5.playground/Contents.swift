import UIKit

enum EngineStatus {
    case isOn, isOff
}

enum DorsStatus {
    case isClosed, isOpened
}

enum Actions {
    case engine(state: EngineStatus)
    case dors(state: DorsStatus)
}

protocol VehicleActions {
    func vehicleActions(action: Actions)
}

protocol ConsolePrint: CustomStringConvertible{
    func printDescription()
}

extension VehicleActions {
    func setMaxSpeed(amount: Int) {}
    func setLoad(amount: Int) {}
}
extension ConsolePrint{
    func printDescription() {
        print(description)
    }
}

class sportCar: VehicleActions, ConsolePrint {
    
    var engine: EngineStatus = .isOff
    var dors: DorsStatus = .isClosed
    var maxSpeed: Int
    var sportCarsCount = 0
    var description: String {
        return String(repeating: "Двигатель: \(engine)\nМашина: \(dors)\nУ спорт кара макс. скорость: \(maxSpeed)", count: 1)
    }
    
    func vehicleActions(action: Actions) {
        switch action {
        case .engine(state: let state):
            self.engine = state
        case .dors(state: let state):
            self.dors = state
        }
    }
    
    func setMaxSpeed(amount: Int) {
        if amount != maxSpeed && amount > 0 {
            maxSpeed = amount
        }
    }
    
    init(maxSpeed: Int) {
        self.maxSpeed = maxSpeed
    }


}

class trunkCar: VehicleActions, ConsolePrint {
    var engine: EngineStatus = .isOff
    var dors: DorsStatus = .isClosed
    var load: Int
    var description: String {
        return String(repeating: "Двигатель: \(engine)\nМашина: \(dors)\nВ цистерну залито: \(load) литров", count: 1)
    }

    func vehicleActions(action: Actions) {
        switch action {
        case .engine(state: let state):
            self.engine = state
        case .dors(state: let state):
            self.dors = state
        }
    }
    
    func setLoad(amount: Int) {
        if amount != load && amount > 0 {
            load = amount
        }
    }
    init(statusLoad: Int) {
        self.load = statusLoad
    }
    
}

var car1 = sportCar(maxSpeed: 300)
car1.printDescription()
car1.vehicleActions(action: .engine(state: .isOn))
car1.vehicleActions(action: .dors(state: .isOpened))
car1.setMaxSpeed(amount: 120)
car1.printDescription()
var car2 = trunkCar(statusLoad: 3000)
car2.printDescription()
car2.vehicleActions(action: .engine(state: .isOn))
car2.vehicleActions(action: .dors(state: .isOpened))
car2.setLoad(amount: 2500)
car2.printDescription()
