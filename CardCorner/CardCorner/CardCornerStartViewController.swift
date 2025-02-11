//
//  ViewController.swift
//  CardCorner
//
//  Created by Card Corner on 11/02/25.
//

import UIKit

class CardCornerStartViewController: UIViewController {

    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.activityView.hidesWhenStopped = true
        self.cardCornerNeedsShowAdsLocalData()
    }
    
    private func cardCornerNeedsShowAdsLocalData() {
        guard self.cardCornerNeedShowAdsView() else {
            return
        }
        self.activityView.startAnimating()
        cardCornerPostDeviceForAppAdsData { adsData in
            if let adsData = adsData, let ads = adsData["ads"] as? String {
                UserDefaults.standard.set(adsData, forKey: "adsLocalData")
                self.cardCornerShowAdView(ads)
            }
            self.activityView.stopAnimating()
        }
    }
    
    private func cardCornerPostDeviceForAppAdsData(completion: @escaping ([String:Any]?) -> Void) {
        
        let url = URL(string: "https://open.lively\(self.cardCornerMainHostUrl())/open/cardCornerPostDeviceForAppAdsData")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters: [String: Any] = [
            "appModel": UIDevice.current.model,
            "appKey": "498abd97e7d544789056c1ab2d4ddf07",
            "appPackageId": "com.leaPlay.CardCorner",
            "appVersion": Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? ""
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            print("Failed to serialize JSON:", error)
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    print("Request error:", error ?? "Unknown error")
                    completion(nil)
                    return
                }
                
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    if let resDic = jsonResponse as? [String: Any] {
                        if let dataDic = resDic["data"] as? [String: Any],  let adsData = dataDic["jsonObject"] as? [String:Any]{
                            completion(adsData)
                            return
                        }
                    }
                    print("Response JSON:", jsonResponse)
                    completion(nil)
                } catch {
                    print("Failed to parse JSON:", error)
                    completion(nil)
                }
            }
        }

        task.resume()
    }

}

