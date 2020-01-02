//
//  ViewController.swift
//  AlamofireImageDownload
//
//  Copyright © 2020 Bedu. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
  
  
  @IBOutlet weak var imageView: UIImageView!
  
  var download: DownloadRequest?
  var resumeData: Data!
  
  let url = "https://ucarecdn.com/6db0d613-ea78-4417-9aa8-22075bb08f99/-/scale_crop/320x210/center"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    downloadImage()
    // Do any additional setup after loading the view.
  }
  
  func downloadImage() {
    self.download = AF.download(url).responseData { response in
      if let data = response.value {
        self.imageView.image = UIImage(data: data)
      }
    }
    .downloadProgress { progress in
      let prog = 100*progress.fractionCompleted
      print("Download Progress: \(prog)")
    }
  }
  
  func pause() {
    self.download?.cancel { data in
      self.resumeData = data
    }
  }
  
  func resumeDownload() {
    AF.download(resumingWith: resumeData).responseData { response in
      if let data = response.value {
        self.imageView.image = UIImage(data: data)
      }
    }
  }
  
}

