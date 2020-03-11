//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 山田裕一 on 2020/03/06.
//  Copyright © 2020 yuichi.yamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var startButtonView: UIButton!
    @IBOutlet weak var mainImage: UIImageView!
    
    var timer: Timer!
    var timer_sec: Int = 0
    let keshiki1:UIImage! = UIImage (named: "keshiki1")
    let keshiki2:UIImage! = UIImage (named: "keshiki2.jpg")
    let keshiki3:UIImage! = UIImage (named: "keshiki3")
    var currentKeshiki:UIImage! = UIImage (named: "keshiki1")
    let pauseButtonImage:UIImage! = UIImage (named: "pause")
    let startButtonImage:UIImage! = UIImage (named: "start")
    let state = UIControl.State.normal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startButtonView.setImage(startButtonImage, for: state)
        mainImage.image = keshiki1
    }
    
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 2
        switch mainImage.image {
        case keshiki1:
            mainImage.image = keshiki2
            currentKeshiki = keshiki2
        case keshiki2:
            mainImage.image = keshiki3
            currentKeshiki = keshiki3
        case keshiki3:
            mainImage.image = keshiki1
            currentKeshiki = keshiki1
        default: break
        }
    }
    
    @IBAction func startButton(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            startButtonView.setImage(pauseButtonImage, for: state) }
        else {
            self.timer.invalidate()
            self.timer = nil
            startButtonView.setImage(startButtonImage, for: state)
               }
    }

@IBAction func nextButton(_ sender: Any) {
    if self.timer == nil {
    switch mainImage.image {
    case keshiki1:
        mainImage.image = keshiki2
        currentKeshiki = keshiki2
    case keshiki2:
        mainImage.image = keshiki3
        currentKeshiki = keshiki3
    case keshiki3:
        mainImage.image = keshiki1
        currentKeshiki = keshiki1
    default: break
            }
        }
}
    
    @IBAction func prevButton(_ sender: Any) {
    if self.timer == nil {
    switch mainImage.image {
    case keshiki1:
        mainImage.image = keshiki3
        currentKeshiki = keshiki3
    case keshiki2:
        mainImage.image = keshiki1
        currentKeshiki = keshiki1
    case keshiki3:
        mainImage.image = keshiki2
        currentKeshiki = keshiki2
    default: break
    }
}
    }

    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        secondViewController.focusedKeshiki = currentKeshiki
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            startButtonView.setImage(startButtonImage, for: state)
        }
    }
    
    
    @IBAction func mainImageButton(_ sender: Any) {
    }
    
    
    
    @IBAction func unwind (_ segue: UIStoryboardSegue){
    }
    
    
}



