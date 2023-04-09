//
//  ViewController.swift
//  pinchGesture
//
//  Created by lee on 2023/04/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgPinch: UIImageView!
    
    var initialFontSize:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch) //핀치 제스처 등록
    }
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
            pinch.scale = 1
    }

}

