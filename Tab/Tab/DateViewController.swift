//
//  datePickerViewController.swift
//  swiftStudy2
//
//  Created by lee on 2023/02/21.
//
import UIKit

class DateViewController: UIViewController {
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    let interval = 1.0
    var count = 0
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad() //뷰가 로딩될때 호출됨
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true) //target : 동작될 뷰, selector : 타이머 구동시 실행될 함수
    }


    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated:true)
    }
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
    }
    @objc func updateTime(){ //#selector의 인자로 사용될 메서드 선언시 @objc 키워드가 필요함
        //lblCurrentTime.text = String(count)
        //count = count+1
        let date = NSDate() //현재시간을 NSDate함수를 사용하여 가져옴
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
    }
}
