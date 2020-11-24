////: A UIKit based Playground for presenting user interface
//  
import UIKit
import PlaygroundSupport
//
////protocol UserType {
////    var id: Int { get }
////    var name: String { get set }
////    var surname: String { get set }
////    func getFriendList() -> [User]
////    func getGroupList()
////}
////
////class User: UserType {
////
////    var id: Int = 2354772
////    var name: String = "Иван"
////    var surname: String = "Чернявский"
////
////    func getFriendList() -> [User] {
////        print("Return users")
////        let user = User()
////        return [user]
////    }
////
////    func getGroupList() {
////        print("Return group")
////    }
////}
////
////let user = User()
////user.getFriendList()
////user.getGroupList()
//
////protocol Figure {
////    func calculatePerimetr() -> Double
////
////}
////
////    class Rectangle: Figure {
////
////    var sideA: Double
////    var sideB: Double
////
////    func calculatePerimetr() -> Double {
////        return sideA + sideB
////    }
////
////    init(sideA: Double, sideB: Double) {
////        self.sideA = sideA
////        self.sideB = sideB
////    }
////}
////
////class Circle: Figure {
////    var radius: Double
////
////   func calculatePerimetr() -> Double {
////        return 2.0 * 3.141 * radius
////    }
////    init(radius: Double) {
////        self.radius = radius
////    }
////}
////
////var figures:[Figure] = [
////    Rectangle(sideA: 10, sideB: 15),
////    Circle(radius: 45)
////]
////
////for figure in figures {
////    let perimetr = figure.calculatePerimetr()
////    print(perimetr)
////}
////protocol LetterBelonging{                    // объявляем протокол принадлежности для письма
////    func writeText(_ text: String)
////}
////class Hand{
////    var letterBelonging:LetterBelonging?   // объявляем свойство руки держать принадлежность
////    func write(_ text: String) {          // говорим руке писать
////        letterBelonging?.writeText(text) // и она уже пишет принадлежностью
////    }
////}
////class RedPen: LetterBelonging {
////    func writeText(_ text: String) {
////        print("Пишем красной пастой: \(text)")
////    }
////}
////class BluePen: LetterBelonging {
////    func writeText(_ text: String) {
////        print("Пишем синей пастой: \(text)")
////    }
////}
////class Pencil: LetterBelonging {
////    func writeText(_ text: String) {
////        print("Пишем грифелем: \(text)")
////        print("При этом слышим скрип")
////    }
////}
////class Marker: LetterBelonging {
////    func writeText(_ text: String) {
////        print("Пишем фломастером : ~~\(text)~~")
////        print("При этом пахнет спиртом")
////    }
////}
////class Pen: LetterBelonging {
////    func writeText(_ text: String) {
////        print("Пишем пером : ~~\(text)~~", "Остаются кляксы")
////    }
////}
////let hand = Hand()
////hand.letterBelonging = RedPen()
////hand.write("Привет")
////hand.letterBelonging = BluePen()
////hand.write("Мир")
////hand.letterBelonging = Pencil()
////hand.write("Я написал")
////hand.letterBelonging = Marker()
////hand.write("первую программу")
////hand.write("govno")
////
//
enum WindowsState {
    case open, close
}
enum CarEngine {
    case on, off
}
enum DoorState {
    case open, close
}

protocol Car {
    var brand: String { get }
    var colour: UIColor { get }
    var yearsOld: Int  { get }
    var carEngine: CarEngine { get set }
    var windowsState: WindowsState { get set }
    var doorState: DoorState { get set }
    func window(changeState: WindowsState)
    func engine(changeState: CarEngine)
    func door(changeState: DoorState)
}

extension Car {
    
    func window(changeState: WindowsState) {
        windowsState == changeState
    }

    func engine(changeState: CarEngine) {
        carEngine == changeState
    }
    
    func door(changeState: DoorState) {
        doorState == changeState
    }
   
}


class SportCar: Car {
    var brand: String
    
    var colour: UIColor
    
    var yearsOld: Int
    
    var carEngine: CarEngine
    
    var windowsState: WindowsState
    
    var doorState: DoorState
    
    var turboMode: Bool
    
    var mp3: Bool
    
    init(brand: String,colour: UIColor, yearsOld: Int, carEngine: CarEngine, windowsState: WindowsState, doorState: DoorState, turboMode: Bool, mp3: Bool) {
    
        self.brand = brand
        self.colour = colour
        self.yearsOld = yearsOld
        self.carEngine = carEngine
        self.windowsState = windowsState
        self.doorState = doorState
        self.turboMode = turboMode
        self.mp3 = mp3
}
}

class TrankCar: Car {
    var brand: String
    
    var colour: UIColor
    
    var yearsOld: Int
    
    var carEngine: CarEngine
    
    var windowsState: WindowsState
    
    var doorState: DoorState
    
    var voluemOfBody:Int
    
    var voluemOfCargo: Int
    {
            didSet {
                print("свободного места осталось \(self.voluemOfBody - self.voluemOfCargo) м3.")
            }
        }
    
    init(brand: String,colour: UIColor, yearsOld: Int, carEngine: CarEngine, windowsState: WindowsState, doorState: DoorState, voluemOfBody:Int, voluemOfCargo: Int) {
    
        self.brand = brand
        self.colour = colour
        self.yearsOld = yearsOld
        self.carEngine = carEngine
        self.windowsState = windowsState
        self.doorState = doorState
        self.voluemOfBody = voluemOfBody
        self.voluemOfCargo = voluemOfCargo
}

}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Это шикарная \(brand) \(yearsOld) года выпуска"
    }
}

extension TrankCar: CustomStringConvertible {
    var description: String {
        return "Это \(brand) c объемом кузова \(voluemOfBody) кубов"
    }

}



var sportCar1 = SportCar(brand: "Porshe", colour: .black, yearsOld: 2019, carEngine: .off, windowsState: .close, doorState: .close, turboMode: true, mp3: true)

sportCar1.description
sportCar1.door(changeState: .open)

var trankCar1 = TrankCar(brand: "MAZ", colour: .blue, yearsOld: 2005, carEngine: .off, windowsState: .close, doorState: .close, voluemOfBody: 20, voluemOfCargo: 0)
print(trankCar1.description)
trankCar1.voluemOfCargo = 11
trankCar1.window(changeState: .open)
