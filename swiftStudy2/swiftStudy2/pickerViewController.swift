//
//  pickerViewController.swift
//  swiftStudy2
//
//  Created by lee on 2023/02/22.
//
//delegate사용
import UIKit
class pickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUNM = 1
    var imageArray = [UIImage?]()
    var imageFileName = ["꽃갈피1.jpg", "꽃갈피2.jpg", "조각집.jpg", "CHAT-SHIRE.jpg", "Growing_UP.jpg", "Last_Fantasy.jpg", "LILAC.jpg", "Love_Poem.jpg", "Modern_Times.jpg", "Palette.jpg"]
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var lblImageFileName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0 ..< MAX_ARRAY_NUM{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        lblImageFileName.text = imageFileName[0] //첫번째 출력
        imageView.image = imageArray[0]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUNM
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) ->
    Int{
        return imageFileName.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        //titleForRow 각 row에 대한 타이틀을 정의하는 델리게이트 메서드, //viewForRow도 존재한다
        return imageFileName[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //didSelectRow -> 피커 뷰의 룰렛 선택시 호출되는 델리게이트 메서드
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated:true)
    }
}
