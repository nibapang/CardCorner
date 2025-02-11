//
//  CardInfoVC.swift
//  CardCorner
//
//  Created by Card Corner on 11/02/25.
//

import Foundation
import UIKit

class CardCornerCardInfoVC: UIViewController {
    
    @IBOutlet weak var CardName: UILabel!
    @IBOutlet weak var cardImg: UIImageView!
    @IBOutlet weak var cardTxt: UITextView!
    
    var getName: String?
    var getDetails: String?
    var getImg: String?
    var getQuiz: [CardQuizCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CardName.text = getName
        cardImg.image = UIImage(named: getImg ?? "")
        cardTxt.text = getDetails
        
    }
    
    @IBAction func QuizBtn(_ sender: Any) {
        
        let nextScr = storyboard?.instantiateViewController(withIdentifier: "CardQuizVC") as! CardCornerQuizVC
        nextScr.getAry = getQuiz
        self.navigationController?.pushViewController(nextScr, animated: true)
        
    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
