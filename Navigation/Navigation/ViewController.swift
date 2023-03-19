//
//  ViewController.swift
//  Navigation
//
//  Created by lee on 2023/03/17.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var txtMessage: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){ //해당 세그웨이가 해당 뷰 컨트롤러로 전환되기 전에 호출되는 함수. 데이터의 전달을 위해 사용
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "segue : use button"
            
        } else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.textMessage = txtMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
    }
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn{
            imgView.image = imgOn
            self.isOn = true
        } else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
}

