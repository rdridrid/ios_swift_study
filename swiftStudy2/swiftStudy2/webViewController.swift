//
//  webViewController.swift
//  swiftStudy2
//
//  Created by lee on 2023/02/24.
//

import UIKit
import WebKit
class webViewController: ViewController, WKNavigationDelegate{
    
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url) //url을 받아 URL형으로 선언
        let myRequest = URLRequest(url: myUrl!) //URL Request형으로 선언
        myWebView.load(myRequest)
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        myWebView.navigationDelegate = self
        loadWebPage("https://rdridrid03.tistory.com")
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) { //로딩 중인지를 확인하기 위한 함수
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) { //로딩이 끝났을 때 숨김
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) { //실패했을 때도 숨김my
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated:true)
    }
    func checkUrl(_ url: String) -> String{ //http 프로토콜이 있는지 확인하는 함수 // (-> 자료형) 형태에서 자료형이 반환값
        //파라미터 변수 앞에 _를 추가하면 함수 호출 시 인자 앞에 자료형을 붙여주지 않아도 된다.
        var strUrl = url
        let flag = strUrl.hasPrefix("http://") //http가 존재하는지 확인 후 true,false중 하나를 대입
        if !flag{ //조건앞에 !는 not 연산자
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) { //지정한 사이트로 이동
        loadWebPage("https://www.naver.com")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://www.madeedam.com/main/index.php")
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p> <p><a href=\"http://daum.net\">daum</a>으로 이동</p>"
        //html문을 변수에 저장
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnloadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html") //경로 변수 생성
        let myUrl = URL(fileURLWithPath: filePath!) //경로변수를 이용해 URL변수 생성
        let myRequest = URLRequest(url: myUrl) //URL변수를 이용하여 Request변수를 생성
        myWebView.load(myRequest) //Request변수를 이용하여 HTML파일 로딩
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading() //웹페이지의 로딩을 중단시키는 함수 호출
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload() // 웹 페이지를 리로딩시키는 함수 호출
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
}
