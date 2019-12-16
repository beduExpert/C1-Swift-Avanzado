//
//  MarioReto.swift
//  
//
//

import Foundation

protocol MarioLifes {
  var numberLifes: Int { get set }
  var type: CharacterType { get set }
  mutating func receivedDamage()
}
extension MarioLifes {
  mutating func receivedDamage() {
    numberLifes = 0
  }
}
enum Mario: MarioLifes {
  var type: CharacterType {
    get {
      .Mario
    }
    set {
    }
  }
  
  var numberLifes: Int {
    get {
      return 5
    }
    set {}
  }
}
