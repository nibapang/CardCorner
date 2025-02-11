//
//  CardQuizVC.swift
//  CardCorner
//
//  Created by Card Corner on 11/02/25.
//

import Foundation
import UIKit

class CardCornerQuizVC: UIViewController {

    @IBOutlet weak var que: UILabel!
    @IBOutlet weak var op1: UIButton!
    @IBOutlet weak var op2: UIButton!
    
    var getAry: [CardQuizCategory] = []
    var counter = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI()
    }
    
    @IBAction func AnswerTapped(_ sender: UIButton) {
        
        var userAns = sender.currentImage
        var actualAns = UIImage(named: getAry[counter].correctAns)
        
        if userAns == actualAns {
            score += 1
            showAlert(title: "Correct!", message: "You Click the right card. 🎉")
        }
        else {
            showAlert(title: "Oops!", message: "That’s not the correct card. 😔")
        }
        
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            
            if self.counter + 1 < self.getAry.count {
                //DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.counter += 1
                    self.UpdateUI()
               // }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.showGameOverAlert()
                }
            }
            
        })
        present(alert, animated: true)
    }
    
    func showGameOverAlert() {
        let alert = UIAlertController(
            title: "Game Over!",
            message: "Your final score is \(score)/\(getAry.count).",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Exit", style: .cancel, handler: nil))
        present(alert, animated: true)
    }

    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func UpdateUI() {
        que.text = getAry[counter].que
        op1.setImage(UIImage(named: getAry[counter].op1), for: .normal)
        op2.setImage(UIImage(named: getAry[counter].op2), for: .normal)
    }
    
}
