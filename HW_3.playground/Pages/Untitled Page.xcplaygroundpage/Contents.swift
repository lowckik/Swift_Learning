import UIKit

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

//6. Вывести значения свойств экземпляров в консоль.

//----------------------------------------- НАЧАЛО ВЫПОЛНЕНИЯ ДЗ -------------------------------------------

//Создаем перечисления с возможными действиями
enum TypesOfVehicle {
    case car
    case truck
}
enum VehicleBrands {
    case ferarri
    case porche
    case man
    case volvo
}
enum OptionsOfCar {
    case toTheCar
    case toTheTruck
}

enum SetCarLockSt: String {
    case openCar = "Машина ОТКРЫТА"
    case closeCar = "Машина ЗАКРЫТА"
}
enum SetEngineSt: String {
    case startEngine = "Двигатель ЗАПУЩЕН"
    case stopEngine = "Двигатель ЗАГЛУШЕН"
}

enum SetLoadSt {
    case loadTrunk(count: Int)
    case unloadTrunk(count: Int)
}

//Задаем парметры будущих экземпляров структуры типа ТРАНСПОРТНОЕ СРЕДСТВО
var alarms = "СООБЩЕНИЙ НЕТ"
struct Vehicle {
    let typeVehicle: TypesOfVehicle
    var brand: VehicleBrands
    let manufYear: Int
    var currentMiles: Float {
        didSet {
            let mileage = currentMiles - oldValue
            let currMil = currentMiles 
            print("Автомобиль проехал: \(mileage) \nТукущий пробег: \(currMil)\n")
        }
    }
    var enginePower: Float
    var engineStatus: SetEngineSt
    var maxSpeed: Float
    let seats: Int
    let wheels: Int
    var lockCarSt: SetCarLockSt
    let maxLoad: Int
    var bagegeLoad: Int
    
    
    mutating func startEngine() {
        self.engineStatus = .startEngine
    }
    mutating func stopEngine() {
        self.engineStatus = .stopEngine
    }
    
    mutating func closeCar() {
        self.lockCarSt = .closeCar
    }
    mutating func openCar() {
        self.lockCarSt = .openCar
    }
    
    mutating func load(count: SetLoadSt) {
        switch count {
        case .loadTrunk(count: let count):
            if maxLoad - self.bagegeLoad >= count  {
                self.bagegeLoad += count
                alarms = "В транспортное средство загружено \(count)"
                print(alarms, "\n")
            } else {
                alarms = "Объём груза больше, чем может вместить транспортное средство. СВОБОДНО  \(maxLoad-self.bagegeLoad) кг"
                print(alarms, "\n")
            }
        case .unloadTrunk(count: let count):
            if self.bagegeLoad - count < 0 {
                alarms = "Введите коректное кол-во груза для выгрузки"
                print(alarms, "\n")
            } else {
                self.bagegeLoad -= count
                alarms = "Груз \(count) успешно выгружен. В багажнике занято \(self.bagegeLoad) из доступных \(maxLoad)"
                print(alarms, "\n")
            }
        }
    }
}

//Функция описывающая все узлы траспортного средства ----------
func discribeCar(car: Vehicle) {
    print("""
    Автомобиль: \(car.brand) \n
    Тип шасси: \(car.typeVehicle) \n
    Кол-во колёс: \(car.wheels) \n
    Год выпуска: \(car.manufYear) \n
    Пробег: \(car.currentMiles) \n
    Мощность двигателя: \(car.enginePower) \n
    Макс. скорость км/ч: \(car.maxSpeed) \n
    Кол-во мест: \(car.seats) \n
    Грузоподъёмность: \(car.maxLoad) кг.\n
    В машину загружено: \(car.bagegeLoad) кг.\n
    Двигатель: \(car.engineStatus.rawValue) \n
    Замок: \(car.lockCarSt.rawValue) \n
    
""")
    alarms = "СООБЩЕНИЙ НЕТ"
}

//Создаем два экземпляра структуры с параметрами -------------------------
var car1 = Vehicle(typeVehicle: .car, brand: .ferarri, manufYear: 2020, currentMiles: 0, enginePower: 1000.10, engineStatus: .stopEngine, maxSpeed: 300, seats: 2, wheels: 4, lockCarSt: .closeCar, maxLoad: 200, bagegeLoad: 0)
var car2 = Vehicle(typeVehicle: .truck, brand: .man, manufYear: 2019, currentMiles: 0, enginePower: 545.2, engineStatus: .stopEngine, maxSpeed: 100, seats: 2, wheels: 10, lockCarSt: .closeCar, maxLoad: 15_000, bagegeLoad: 0)

//Проверка работы ---------------------------------------------
car1.load(count: .loadTrunk(count: 132))
car1.currentMiles = 24
print(discribeCar(car: car1))
car1.load(count: .loadTrunk(count: 350))
car1.currentMiles = 103.4
car1.openCar()
print(discribeCar(car: car1))
car1.load(count: .unloadTrunk(count: 42))
print(discribeCar(car: car1))
car2.load(count: .loadTrunk(count: 12000))
car2.startEngine()
car2.currentMiles = 3000
print(discribeCar(car: car2))




