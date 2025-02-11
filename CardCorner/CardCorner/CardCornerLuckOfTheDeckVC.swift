//
//  LuckOfTheDeckVC.swift
//  CardCorner
//
//  Created by Card Corner on 11/02/25.
//

import Foundation
import UIKit

class CardCornerLuckOfTheDeckVC: UIViewController {

    @IBOutlet weak var queLbl: UILabel!
    
    @IBOutlet weak var card1: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card3: UIButton!
    @IBOutlet weak var card4: UIButton!
    @IBOutlet weak var btnView: UIView!
    
    var buttonAry: [UIButton] = []
    var counter = 0
    var score = 0 // To track the score

    override func viewDidLoad() {
        super.viewDidLoad()
        btnView.isHidden = true
        buttonAry = [card1, card2, card3, card4]
        GenrateRanAry()
        SetBackCardImg()
        UpdateUI()
    }
    
    @IBAction func AnswerButton(_ sender: UIButton) {
        
        self.btnView.isHidden = false

        // Set images for the cards
        card1.setImage(UIImage(named: cardAry[counter].fristImgName), for: .normal)
        card2.setImage(UIImage(named: cardAry[counter].secImgName), for: .normal)
        card3.setImage(UIImage(named: cardAry[counter].thirdImgName), for: .normal)
        card4.setImage(UIImage(named: cardAry[counter].fourthImgName), for: .normal)

        // Check if the selected card is correct
        
        let userAns = sender.currentImage
        let actualAns = UIImage(named: cardAry[counter].correctAns)
        
        if userAns == actualAns {
            score += 1
            showAlert(title: "Correct!", message: "You guessed the right card. 🎉")
        } else {
            showAlert(title: "Oops!", message: "That’s not the correct card. 😔")
        }
    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func SetBackCardImg() {
        for btn in buttonAry {
            btn.setImage(UIImage(named: "back card"), for: .normal)
        }
    }
    
    func UpdateUI() {
        btnView.isHidden = true
        SetBackCardImg()
        queLbl.text = cardAry[counter].que
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            
            if self.counter + 1 < cardAry.count {
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
            message: "Your final score is \(score)/\(cardAry.count).",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { _ in
            self.resetGame()
        }))
        alert.addAction(UIAlertAction(title: "Exit", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    func resetGame() {
        score = 0
        counter = 0
        GenrateRanAry() // Regenerate random cards if needed
        SetBackCardImg()
        UpdateUI()
    }
}
