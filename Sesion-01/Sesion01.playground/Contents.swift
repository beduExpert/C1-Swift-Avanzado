import UIKit

enum Device {
  case iPad
  case iPhone
  
  var model: Int {
    switch self {
    case .iPhone:
      return 11
    case .iPad:
      return 2
    }
  }
  
  func name() -> String {
    switch self {
    case .iPhone:
      return "iPhone"
    case .iPad:
      return "iPad"
    }
  }
}

let device = Device.iPhone
print(device.name())



// Nested Enums
enum Alimento {
  
  enum Bebida {
    case refresco
    case cerveza
    case cafe
  }
  
  enum Comida {
    case taco
    case quesadilla
    case pizza
  }
  
  case paquete(comida: Comida, bebida: Bebida)
  
  func getDescription() -> String {
    switch self {
    case let .paquete(bebida, comida):
      return "Paquete elegido con: \(bebida) y \(comida)"
    }
  }
}

let alim = Alimento.paquete(comida: .pizza, bebida: .cerveza)
print(alim.getDescription())



enum LightSwitch {
  case off
  case on
  mutating func turn() {
    switch self {
    case .off:
      self = .on
    case .on:
      self = .off
    }
  }
}

var ls = LightSwitch.off
ls.turn()
ls

// Custom Inits
enum IntCategory {
  case small
  case medium
  case big
  case weird
  
  init(number: Int) {
    switch number {
    case 0..<1000 :
      self = .small
    case 1000..<100000:
      self = .medium
    case 100000..<1000000:
      self = .big
    default:
      self = .weird
    }
  }
}

let intCategory = IntCategory(number: 12345)
print(intCategory)

