//
//  alertViewController.swift
//  swiftStudy2
//
//  Created by lee on 2023/02/22.
// alert, 전구가 켜져있을 경우 이미 켜져있다는 알림을 보내는 등i

import UIKit
class alertViewController: UIViewController{
    let imgOn = UIImage(named: "lamp_on.png") //상수 let
    let imgOff = UIImage(named: "lamp_off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    var isLampOn = true
    @IBOutlet var lampImg: UIImageView!
    override func viewDidLoad(){
        super.viewDidLoad()
        lampImg.image = imgOn
    }
    
    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn==true){
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else{
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn{
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {ACTION in self.lampImg.image = self.imgOff
                self.isLampOn = false}) //1회용 함수, 익명함수 혹은 Closure라고 한다.
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler:nil) //특별한 동작이 없으므로 handler에 nil
            lampOffAlert.addAction(offAction) //만든 동작들을 알람에 추가
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "아니오, 끕니다(off).", style: UIAlertAction.Style.default, handler: {ACTION in self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다(on).", style: UIAlertAction.Style.default){ACTION in self.lampImg.image = self.imgOn}
        //onAction함수는 핸들러 매개변수를 없애고 매개변수 입력 이후에 클로저를 넣었다.
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.destructive, handler: {ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
    }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
