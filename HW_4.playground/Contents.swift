import UIKit

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.

enum TypesOfVehicle {
    case simpleCar, raceCar, truckCar, testVehicle
}
enum VehicleBrands {
    case VAZ, FERRARI, KAMAZ
}
enum EngineTypes {
    case regular,electro,disele
}
enum SumAction {
    case test1,test2,onAir,offAir,fullLoad,notFullLoad,drifftCar,raceCare
}
enum ConditionStatus {
    case on,off
}
enum BodyType {
    case drifftCar,raceCare
}
enum LoadTruck {
    case fullLoad,notFullLoad
}

class Vechicles {
    let typeVehicle: TypesOfVehicle
    var brand: VehicleBrands
    let manufYear: Int
    var engineType: EngineTypes
    var enginePower: Int
    var mileage: Int
    var wheels: Int
    let seats: Int
    var airCondition: ConditionStatus?
    var bodyType: BodyType?
    var load: LoadTruck?
    var resAction: String?
    
    
    init(typeVehicle: TypesOfVehicle, brand: VehicleBrands, manufYear: Int, engineType: EngineTypes, enginePower: Int, mileage: Int, wheels: Int, seats: Int) {
        self.typeVehicle = typeVehicle
        self.brand = brand
        self.manufYear = manufYear
        self.engineType = engineType
        self.enginePower = enginePower
        self.mileage = mileage
        self.wheels = wheels
        self.seats = seats
    }
    
    func test() {} // Для галочки ;)
    
    func action(doAction: SumAction) {
        if typeVehicle == .testVehicle {
            if doAction == .test1 || doAction == .test2 {
                if doAction == .test1 {
                    resAction = "Тест_1"
                } else {
                    resAction = "Тест_2"
                }
            } else {
                print("Таких функций в данном транспортном средстве нет. \nВыбирете пожалуйста из доступных: \n - test1(для первой проверки). \n - test2(для второй проверки)\n")
            }
        }
    }
}

class SimpleCars: Vechicles {
    init(airCondition: ConditionStatus, brand: VehicleBrands, manufYear: Int, enginePower: Int, mileage: Int) {
        super.init(typeVehicle: .simpleCar, brand: brand, manufYear: manufYear, engineType: .regular, enginePower: enginePower, mileage: mileage, wheels: 4, seats: 5)
    }

    override func action(doAction: SumAction) {
        if typeVehicle == .simpleCar {
            if doAction == .onAir || doAction == .offAir {
                if doAction == .onAir {
                    airCondition = .on
                    resAction = "Кондиционер включён"
                } else {
                    airCondition = .off
                    resAction = "Кондиционер выключен"
                }
            } else {
                print("Таких функций в данном транспортном средстве нет. \nВыбирете пожалуйста из доступных: \n - onAir(для включения кондиционера). \n - offAir(для выключения кондиционера)\n")
            }
        }
    }
}

class RaceCars: Vechicles {
    var spolers: Bool
    init(spolers: Bool, bodyType: BodyType, brand: VehicleBrands, manufYear: Int, enginePower: Int, mileage: Int ) {
        self.spolers = spolers
        super.init(typeVehicle: .raceCar, brand: brand, manufYear: manufYear, engineType: .regular, enginePower: enginePower, mileage: mileage, wheels: 4, seats: 1)
    }

    override func action(doAction: SumAction) {
        if doAction == .drifftCar || doAction == .raceCare {
            if doAction == .drifftCar {
                bodyType = .drifftCar
                resAction = "Установлен обвес для дрифта"
            } else {
                bodyType = .raceCare
                resAction = "Установлен обвес для гонок"
            }
        } else {
            print("Таких функций в данном транспортном средстве нет. \nВыбирете пожалуйста из доступных: \n - drifftCar(установить обвес для дрифта). \n - raceCare(установить обвес для гонки)\n")
        }
    }
}

class TruckCars: Vechicles {
    var additionalTank: Int
    init(additionalTank: Int, load: LoadTruck, brand: VehicleBrands, manufYear: Int, enginePower: Int, mileage: Int) {
        self.additionalTank = additionalTank
        super.init(typeVehicle: .truckCar, brand: brand, manufYear: manufYear, engineType: .disele, enginePower: enginePower, mileage: mileage, wheels: 10, seats: 2)
    }

    func chengeAdditTunck(addTunk: Int) {
        additionalTank = addTunk
        resAction! += "\nЗамена доп. бака на бак объёмом: \(additionalTank)"
        print("Установлен доп. бак объёмом: \(additionalTank)\n")
    }
    override func action(doAction: SumAction) {
        if typeVehicle == .truckCar {
            if doAction == .fullLoad || doAction == .notFullLoad {
                if doAction == .fullLoad {
                    load = .fullLoad
                    resAction = "\nГрузовик загружен полностью."
                } else {
                    load = .notFullLoad
                    resAction = "\nГрузовик не разгружен."
                }
            } else {
                print("Таких функций в данном транспортном средстве нет. \nВыбирете пожалуйста из доступных: \n - fullLoad(для полной загрузки). \n - notFullLoad(для полной выгрузки)\n")
            }
        }
        
    }
}
func discribeVehicle(car: Vechicles) {
    if car.typeVehicle == .testVehicle   {
        print("""
        Тип шасси: \(car.typeVehicle) \n
        Автомобиль: \(car.brand) \n
        Год выпуска: \(car.manufYear) \n
        Тип ДВС: \(car.engineType) \n
        Мощность двигателя: \(car.enginePower) \n
        Пробег: \(car.mileage) \n
        Кол-во колёс: \(car.wheels) \n
        Кол-во мест: \(car.seats) \n
        Сообщения БК: \(car.resAction ?? "СООБЩЕНИЙ НЕТ") \n
    """)
    } else if car.typeVehicle == .simpleCar {
        print("""
        Тип шасси: \(car.typeVehicle) \n
        Автомобиль: \(car.brand) \n
        Год выпуска: \(car.manufYear) \n
        Тип ДВС: \(car.engineType) \n
        Мощность двигателя: \(car.enginePower) \n
        Пробег: \(car.mileage) \n
        Кол-во колёс: \(car.wheels) \n
        Кол-во мест: \(car.seats) \n
        Климт. уст.: \(car.airCondition ?? .off) \n
        Сообщения БК: \(car.resAction ?? "СООБЩЕНИЙ НЕТ") \n
    """)
    } else if car.typeVehicle == .raceCar {
        print("""
        Тип шасси: \(car.typeVehicle) \n
        Автомобиль: \(car.brand) \n
        Год выпуска: \(car.manufYear) \n
        Тип ДВС: \(car.engineType) \n
        Мощность двигателя: \(car.enginePower) \n
        Пробег: \(car.mileage) \n
        Кол-во колёс: \(car.wheels) \n
        Кол-во мест: \(car.seats) \n
        Обвес: \(car.bodyType ?? .raceCare) \n
        Сообщения БК: \(car.resAction ?? "СООБЩЕНИЙ НЕТ") \n
    """)
    } else if car.typeVehicle == .truckCar {
        print("""
        Тип шасси: \(car.typeVehicle) \n
        Автомобиль: \(car.brand) \n
        Год выпуска: \(car.manufYear) \n
        Тип ДВС: \(car.engineType) \n
        Мощность двигателя: \(car.enginePower) \n
        Пробег: \(car.mileage) \n
        Кол-во колёс: \(car.wheels) \n
        Кол-во мест: \(car.seats) \n
        Загрузка: \(car.load ?? .notFullLoad) \n
        Сообщения БК: \(car.resAction ?? "СООБЩЕНИЙ НЕТ") \n
    """)
    }
}



let car1 = SimpleCars(airCondition: .off, brand: .VAZ, manufYear: 1990, enginePower: 60, mileage: 125_000)
let car2 = RaceCars(spolers: true, bodyType: .drifftCar, brand: .FERRARI, manufYear: 2020, enginePower: 1000, mileage: 15)
let car3 = TruckCars(additionalTank: 1000, load: .notFullLoad, brand: .KAMAZ, manufYear: 1986, enginePower: 320, mileage: 1_123_000)


car1.action(doAction: .onAir)
discribeVehicle(car: car1)

car2.action(doAction: .raceCare)
discribeVehicle(car: car2)

car3.action(doAction: .fullLoad)
car3.chengeAdditTunck(addTunk: 800)
discribeVehicle(car: car3)


