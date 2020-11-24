//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


enum CarEngine {
   case on
   case off
}


enum LiftingTheBody { // Поднятие кузова ( для самосвала)
   case  raise
   case drop
}

enum HatchState { //   состояние люка
   case open
   case close
}

enum Turbo { // режим турбо
   case on
   case off
}

class Car {
   var brand: String
   var yearsOld: Int
   var colour: UIColor
   var mp3: Bool
   var carEngine: CarEngine
   static var carCount = 0
   init (brand: String, yearsOld: Int, colour: UIColor, mp3: Bool, carEngine: CarEngine) {
       self.brand = brand
       self.yearsOld = yearsOld
       self.colour = colour
       self.mp3 = mp3
       self.carEngine = carEngine
       Car.carCount += 1
   }
   func changeCarEngine() {
           self.carEngine = carEngine == .on ? .off : .on
       }
}

class TrunkCar: Car {
   var voluemOfBody:Int = 0
   var voluemOfCargo: Int  = 0
   {
           didSet {
               print("свободного места осталось \(self.voluemOfBody - self.voluemOfCargo) м3.")
           }
       }


       var liftingTheBody: LiftingTheBody

       init(brand: String, yearsOld: Int, colour: UIColor, mp3: Bool, carEngine: CarEngine, voluemOfBody:Int, voluemOfCargo: Int, liftingTheBody: LiftingTheBody) {
           self.voluemOfBody = voluemOfBody
           self.voluemOfCargo = voluemOfCargo
           self.liftingTheBody = liftingTheBody

       super.init(brand: brand, yearsOld: yearsOld, colour: colour, mp3: mp3, carEngine: carEngine)
   }

   override func changeCarEngine() {
       super.changeCarEngine()
       liftingTheBody = .raise
    print("Осторожно происходит подъем кузова")
   }
 

}

//  Пример как работает инициализация и методы
var trunkCar1 = TrunkCar(brand: "Камаз", yearsOld: 5, colour: .black, mp3: true, carEngine: .off, voluemOfBody: 30, voluemOfCargo: 5, liftingTheBody: .drop)
trunkCar1.voluemOfCargo = 6
trunkCar1.changeCarEngine()
trunkCar1.carEngine
trunkCar1.raiseTheBody()

class SportCar: Car {
   var hatchState: HatchState
   var maximumSpeed: Int
   var turbo: Turbo


   init(brand: String, yearsOld: Int, colour: UIColor, mp3: Bool, carEngine: CarEngine, hatchState: HatchState, maximumSpeed: Int, turbo: Turbo)
   {
       self.hatchState = hatchState
       self.maximumSpeed = maximumSpeed
       self.turbo = turbo
       super.init(brand: brand, yearsOld: yearsOld, colour: colour, mp3: mp3, carEngine: carEngine)
   }

   override func changeCarEngine() {
       super.changeCarEngine()
   }
   func openTheHatch() {
       hatchState = .open
       print("ОТКРЫТИЕ ЛЮКА")

   }
   func enableTurboMode() {
       turbo = .on
       print("Включен режим турбо")
   }

}

//  Проверка
var sportCar1 = SportCar(brand: "Ферарри", yearsOld: 3, colour: .red, mp3: true, carEngine: .off, hatchState: .close, maximumSpeed: 450, turbo: .on)
sportCar1.changeCarEngine()
sportCar1.carEngine
sportCar1.enableTurboMode()
sportCar1.openTheHatch()
Car.carCount

1+1
