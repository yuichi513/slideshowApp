//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 山田裕一 on 2020/03/06.
//  Copyright © 2020 yuichi.yamada. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondImage: UIImageView!
    
    var focusedKeshiki:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondImage.image = focusedKeshiki
        secondImage.transform = CGAffineTransform(scaleX: 2,y: 2)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
