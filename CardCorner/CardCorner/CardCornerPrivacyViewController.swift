//
//  CardCornerPrivacyViewController.swift
//  CardCorner
//
//  Created by Card Corner on 11/02/25.
//

import UIKit
import WebKit
import Adjust
import FBSDKCoreKit

class CardCornerPrivacyViewController: UIViewController, WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    @objc var url: String?
    let cardCornerPrivacyUrl = ""
    let adsP: [String: Any]? = UserDefaults.standard.object(forKey: "adsLocalData") as? [String: Any]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cardCornerInitSubViews()
        cardCornerStartLoadWebView()
    }
    
    @IBAction func btnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    private func cardCornerInitSubViews() {
        webView.scrollView.contentInsetAdjustmentBehavior = .always
        view.backgroundColor = .black
        webView.backgroundColor = .black
        webView.isOpaque = false
        webView.scrollView.backgroundColor = .black
        indicatorView.hidesWhenStopped = true
        
        if let _ = url {
            self.backBtn.isHidden = true
        }
        
        let userContentC = webView.configuration.userContentController
        userContentC.add(self, name: "Post")
        webView.navigationDelegate = self
        webView.uiDelegate = self
    }
    
    private func cardCornerStartLoadWebView() {
        let urlStr = url ?? cardCornerPrivacyUrl
        guard let url = URL(string: urlStr) else { return }
        
        indicatorView.startAnimating()
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    // MARK: - WKScriptMessageHandler
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "Post" , let adsP = adsP, let p = adsP["params"] as? [String], let body = message.body as? [String: Any] {
            let eventName = body["name"] as? String ?? ""
            let data = body["data"] as? [String: Any] ?? Dictionary.init()
            
            if eventName == p[3] {
                if let url = URL(string: data[p[5]] as? String ?? ""),
                   UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            } else if eventName == p[0] || eventName == p[1] {
                let event = ADJEvent(eventToken: adsP[eventName] as? String ?? eventName)
                let value = data[p[6]] as? String
                if let value = value, let v = Double(value) {
                    event?.setRevenue(v, currency: data[p[4]] as? String ?? "")
                    AppEvents.shared.logEvent(AppEvents.Name(eventName), valueToSum: v, parameters: data as? [AppEvents.ParameterName : Any])
                } else {
                    AppEvents.shared.logEvent(AppEvents.Name(eventName), parameters: data as? [AppEvents.ParameterName : Any])
                }
                Adjust.trackEvent(event)
                
            } else {
                let event = ADJEvent(eventToken: adsP[eventName] as? String ?? eventName)
                Adjust.trackEvent(event)
                AppEvents.shared.logEvent(AppEvents.Name(eventName), parameters: data as? [AppEvents.ParameterName : Any])
            }
        }
    }
    
    // MARK: - WKNavigationDelegate
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.async {
            self.indicatorView.stopAnimating()
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        DispatchQueue.main.async {
            self.indicatorView.stopAnimating()
        }
    }
    
    // MARK: - WKUIDelegate
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil, let url = navigationAction.request.url {
            UIApplication.shared.open(url)
        }
        return nil
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
