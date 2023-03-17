//
//  imageViewController.swift
//  swiftStudy2
//
//  Created by lee on 2023/02/20.
//

import UIKit

class ImageViewController: UIViewController {
    var isZoom = false
    var imgOn : UIImage? //값이 없을 수도 있다는 옵셔널 변수 '?'
    var imgOff : UIImage?
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    @IBOutlet var backButton: UIBarButtonItem!
    //@IBOutlet var backBarButtonItem: UIBarButtonItem!
    override func viewDidLoad() { //뷰가 호출될 때 호출되는 함수
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgOn = UIImage(named: "lamp_on.png") //프로젝트에 있는 파일이름
        imgOff = UIImage(named: "lamp_off.png")
        imgView.image = imgOn
        
    }

    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated:true)
    }
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        if(isZoom){
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대",for: .normal) //버튼의 텍스트를 확대로 변경
        }
        else{
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn{ //괄호없이 조건 지정 가능, 괄호도 물론 사용 할 수 있다
            imgView.image = imgOn
        }
        else{
            imgView.image = imgOff
        }
    }
    
}
