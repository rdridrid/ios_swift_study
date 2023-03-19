//
//  EditViewController.swift
//  Navigation
//
//  Created by lee on 2023/03/19.
//

import UIKit

//프로토콜 형태의 델리게이트 추가
protocol EditDelegate{ //프로토콜을 상속받은 클래스는 반드시 모든 함수를 구현해야함.
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {

    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate : EditDelegate?
    var isOn = false
    @IBOutlet var lblWay: UILabel!
    
    @IBOutlet var txtMessage: UITextField!
    
    @IBOutlet var swIsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txtMessage.text = textMessage
        swIsOn.isOn = isOn
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if(delegate != nil){
            delegate?.didMessageEditDone(self,message: txtMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        _ = navigationController?.popViewController(animated: true)
        //segue연결시 show로 했기 때문에 되돌아갈때 pop이용
    }
    
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
        } else{
            isOn = false
        }
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
