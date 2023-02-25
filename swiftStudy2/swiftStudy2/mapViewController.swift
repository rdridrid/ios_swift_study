//
//  mapViewController.swift
//  swiftStudy2
//
//  Created by lee on 2023/02/25.
//미완성

import UIKit
import MapKit //지도를 확대, 축소 및 이동 등, 여러 기능 제공.
class mapViewController: ViewController, CLLocationManagerDelegate{
    
    @IBOutlet var myMap: MKMapView!
    
    @IBOutlet var lblLocationInfo1: UILabel!
    
    @IBOutlet var lblLocationInfo2: UILabel!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        //뷰 호출 시 지도가 나타남
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy  = kCLLocationAccuracyBest // 정확도를 최고로 설정
        locationManager.requestWhenInUseAuthorization() // 위치 데이터를 추적하기 위해 사용자에게 승인 요구
        //xcode 버전에 따라 지도가 안 나타날 수도 있다
        //Info.plist를 수정해서 해결할 수 있다.
        locationManager.startUpdatingLocation() //위치 업데이트
        myMap.showsUserLocation = true
    }
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double){ //위도와 경도를 매개변수로
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue) //
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let pLocation = locations.last //위치가 변경되면 가장 마지막 위치 값을 얻는다
        goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.001) //delta값이 작을수록 지도가 확대된다.
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil { //지역값이 존재할 경우
                address += " "
                address += pm!.locality! //address 문자열 추가
            }
            if pm!.thoroughfare != nil{ //도로값이 존재할 경우
                address += " "
                address += pm!.thoroughfare!
            }
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        locationManager.stopUpdatingLocation() //위치 업데이트를 종료함
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
    }
    
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
