//
//  ViewController.swift
//  War
//
//  Created by Jia Liu on 15/6/28.
//  Copyright (c) 2015年 Jia Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Player2WinCount: UITextField!
    @IBOutlet weak var Player1WinCount: UITextField!
    @IBOutlet weak var RoundNumber: UITextField!
    @IBOutlet weak var FirstCardImage: UIImageView!
    @IBOutlet weak var SecondCardImage: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var backgoundImageView: UIImageView!
    @IBOutlet weak var playRoundButton2: UIButton!
    
    var cardNameArray:[String] = [
                                    "CardClub1", "CardClub2", "CardClub3", "CardClub4", "CardClub5",
                                    "CardClub6", "CardClub7", "CardClub8", "CardClub9", "CardClub10",
                                    "CardClub11", "CardClub12", "CardClub13",
                                    "CardDiamond1", "CardDiamond2", "CardDiamond3", "CardDiamond4", "CardDiamond5",
                                    "CardDiamond6", "CardDiamond7", "CardDiamond8", "CardDiamond9", "CardDiamond10",
                                    "CardDiamond11", "CardDiamond12", "CardDiamond13",
                                    "CardHeart1", "CardHeart2", "CardHeart3", "CardHeart4", "CardHeart5",
                                    "CardHeart6", "CardHeart7", "CardHeart8", "CardHeart9", "CardHeart10",
                                    "CardHeart11", "CardHeart12", "CardHeart13",
                                    "CardSpade1", "CardSpade2", "CardSpade3", "CardSpade4", "CardSpade5",
                                    "CardSpade6", "CardSpade7", "CardSpade8", "CardSpade9", "CardSpade10",
                                    "CardSpade11", "CardSpade12", "CardSpade13",
                                    "CardJoker", "CardJokerS"
                                    ]
    
    var card1:Int = -1
    var card2:Int = -1
    
    var FirstPlayerDrawed:BooleanType = false
    var SecondPlayerDrawed:BooleanType = false
    
    var roundCount:Int = 0
    
    var FirstPlayerWinCount = 0
    var SecondPlayerWinCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playgroundTapped(sender: UIButton) {
        /*
        var firstRandomNumber = arc4random_uniform(13) + 1
        var secondRandomNumber = arc4random_uniform(13) + 1
        
        var firstCardString = "CardSpade" + String(stringInterpolationSegment: firstRandomNumber)
        var secondCardString = "CardSpade" + String(stringInterpolationSegment: secondRandomNumber)
        
        self.firstCardImageView.image = UIImage(named: firstCardString)
        self.secondCardImageView.image = UIImage(named: secondCardString)
        */
        
        var firstRandomNumber:Int = Int(arc4random()%53)
        
        var firstCardString = cardNameArray[firstRandomNumber]
        //println(String(secondRandomNumber) + "*********")
        
        self.FirstCardImage.image = UIImage(named: firstCardString)
        
        if(firstRandomNumber + 1 <= 52){
            card1 = (firstRandomNumber + 1)%13
        } else {
            card1 = firstRandomNumber + 1
        }
        
        FirstPlayerDrawed = true
        
        playRoundButton.enabled = false
        
        //判断对方是否已经摸牌
        if(SecondPlayerDrawed){
            compare()
            startNextRound()
        }
    }
    
    @IBAction func playground2Tapped(sender: UIButton) {
        var secondRandomNumber:Int = Int(arc4random()%53)
        var secondCardString = cardNameArray[secondRandomNumber]
        self.SecondCardImage.image = UIImage(named: secondCardString)
        
        if(secondRandomNumber + 1 <= 52){
            card2 = (secondRandomNumber + 1)%13
        } else {
            card2 = secondRandomNumber + 1
        }
        
        SecondPlayerDrawed = true
    
        playRoundButton2.enabled = false
        
        //判断对方是否已经摸牌
        if(FirstPlayerDrawed){
            compare()
            startNextRound()
        }
    }
    
    func compare(){
        print("card1 is " + String(card1))
        print("card2 is " + String(card2))
        if(card1 == card2){
            //平局
            print("平局")
        } else if (card1 > card2){
            //player1胜利
            print("player1胜利")
            FirstPlayerWinCount += 1;
            self.Player1WinCount.text = String(FirstPlayerWinCount)
        } else if (card1 < card2){
            //player2胜利
            print("player2胜利")
            SecondPlayerWinCount += 1;
            self.Player2WinCount.text = String(SecondPlayerWinCount)
        }
    }
    
    func startNextRound(){
        FirstPlayerDrawed = false
        SecondPlayerDrawed = false
        playRoundButton.enabled = true
        playRoundButton2.enabled = true
        roundCount += 1
        self.RoundNumber.text = String(roundCount)
    }
}

