//
//  ViewController.swift
//  MoviePlayer
//
//  Created by lee on 2023/03/29.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        //let filePath:String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        //let url = NSURL(fileURLWithPath: filePath!)
        let url = NSURL(string: "/Users/lee/Desktop/swiftstudy/MoviePlayer/MoviePlayer/FastTyping.mp4")!
        //옵셔널 변수 오류가 계속 나는 중, 나중에 해결하기
        playVideo(url: url)
    }
 
    
    @IBAction func btnPlayerExternalMovie(_ sender: UIButton) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        playVideo(url: url)
    }
    private func playVideo(url: NSURL){
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        
        self.present(playerController, animated: true){
            player.play()
        }
    }
    
}

