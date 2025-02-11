//
//  MainLearnAndQuizVC.swift
//  CardCorner
//
//  Created by Card Corner on 11/02/25.
//

import Foundation
import UIKit

class CardCornerMainLearnAndQuizVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func NextScrBtn(_ sender: UIButton) {
        
        let nextScr = self.storyboard?.instantiateViewController(withIdentifier: "CardInfoVC") as! CardCornerCardInfoVC
        
        if sender.tag == 0 {
            nextScr.getName = AllCardDetails[0].name
            nextScr.getImg = AllCardDetails[0].cardImg
            nextScr.getDetails = AllCardDetails[0].cardDetails
            nextScr.getQuiz = AllCardDetails[0].quiz
        }
        else if sender.tag == 1 {
            nextScr.getName = AllCardDetails[1].name
            nextScr.getImg = AllCardDetails[1].cardImg
            nextScr.getDetails = AllCardDetails[1].cardDetails
            nextScr.getQuiz = AllCardDetails[1].quiz
        }
        else if sender.tag == 2 {
            nextScr.getName = AllCardDetails[2].name
            nextScr.getImg = AllCardDetails[2].cardImg
            nextScr.getDetails = AllCardDetails[2].cardDetails
            nextScr.getQuiz = AllCardDetails[2].quiz
        }
        else if sender.tag == 3 {
            nextScr.getName = AllCardDetails[3].name
            nextScr.getImg = AllCardDetails[3].cardImg
            nextScr.getDetails = AllCardDetails[3].cardDetails
            nextScr.getQuiz = AllCardDetails[3].quiz
        }

        self.navigationController?.pushViewController(nextScr, animated: true)
        
    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
