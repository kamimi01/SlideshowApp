//
//  ScaleViewController.swift
//  SlideshowApp
//
//  Created by Mika Urakawa on 2019/04/20.
//  Copyright © 2019 kamimi01. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {
    @IBOutlet weak var UIImageView1: UIImageView!
    //受け取るための変数
    var receiveImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIImageView1.image = receiveImage
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
