//
//  ViewController.swift
//  Ejemplo01UserDefaults
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var name: UITextField!
  @IBOutlet weak var age: UITextField!
  @IBOutlet weak var results: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func save(_ sender: Any) {
    saveDataLocally()
  }
  
  @IBAction func load(_ sender: Any) {
    
  }
  
  func saveDataLocally() {
    
  }
  
}

