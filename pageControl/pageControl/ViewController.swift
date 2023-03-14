//
//  ViewController.swift
//  pageControl
//
//  Created by lee on 2023/03/13.
//

import UIKit

var images = ["weather.png","5cm.jpg","weather2.jpg","word.jpg","Comet.jpg","door.jpg"]

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    
    
    @IBOutlet var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count //numberOfPages = 페이지 컨트롤의 전체 페이지 수 = 이미지의 수 만큼
        pageControl.currentPage = 0 //현재 페이지를 0
        pageControl.pageIndicatorTintColor = UIColor.green //페이지 컨트롤의 페이지 부분. (약간 집모양? 도형)
        pageControl.currentPageIndicatorTintColor = UIColor.red //페이지 컨트롤의 현재 페이지를 표시하는 색상?
        imgView.image = UIImage(named: images[0])
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
}

