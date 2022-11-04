//
//  DetailViewController.swift
//  DemoWKWebView
//
//  Created by 뚱건 on 2022/11/04.
//

import UIKit
// 웹뷰를 위한 임포트
import WebKit

// WebView의 이벤트 처리를 위한 델리게이트
class DetailViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    
    @IBOutlet var Navitem: UINavigationItem!
    
    
    var webView:WKWebView!
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    var user:ResultsData? = nil
    
    // 컨트롤을 배치
    override func loadView() {
        webView = WKWebView(frame: CGRect.zero)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.view = self.webView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let searchStr = "https://search.naver.com/search.naver?query=" + (user?.location.street.name)!
        let searchStr2 = searchStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        // 다시 아웃렛 연결 이름
        self.Navitem.title = (self.user?.location.street.name)!
        
        let req = URLRequest(url: URL(string: searchStr2!)!)
        self.webView.load(req)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityIndicator.frame = CGRect(x: view.frame.midX-50, y: view.frame.midY-50, width: 100, height: 100)
        activityIndicator.color = UIColor.red
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicator.removeFromSuperview()
    }


}

