//
//  ViewController.swift
//  Assignment2
//
//  Created by Akshay on 2/15/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var LeftImage: UIImageView!
    @IBOutlet weak var RightImage: UIImageView!
    @IBOutlet weak var roundBtn: UILabel!
    @IBOutlet weak var LeftImage1: UIImageView!
    @IBOutlet weak var RightImage1: UIImageView!
    
    @IBOutlet weak var stepper2: UIStepper!
    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var bet1: UILabel!
    @IBOutlet weak var bet2: UILabel!
    @IBOutlet weak var mLeft1: UILabel!
    @IBOutlet weak var mLeft2: UILabel!
    
    var round:Int = 0
    var sum1:Int = 0
    var sum2:Int = 0
    var totMoney1:Int = 5
    var totMoney2:Int = 100
    var res:String = ""
    var zero:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mLeft1.text = "MONEY LEFT: 100"
        mLeft2.text = "MONEY LEFT: 100"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func RollBtn(_ sender: UIButton) {
        let diceOne = Int(arc4random_uniform(6)) + 1
        let diceTwo = Int(arc4random_uniform(6)) + 1
        let diceOne1 = Int(arc4random_uniform(6)) + 1
        let diceTwo1 = Int(arc4random_uniform(6)) + 1
        
        if (totMoney1 & totMoney2) > 0 {
            
        round += 1
        roundBtn.text = "Round : \(round)"
        
        LeftImage.image = UIImage(named: "Dice\(diceOne)")
        RightImage.image = UIImage(named: "Dice\(diceTwo)")
        
        LeftImage1.image = UIImage(named: "Dice\(diceOne1)")
        RightImage1.image = UIImage(named: "Dice\(diceTwo1)")
        
        sum1 = diceOne + diceTwo
        sum2 = diceOne1 + diceTwo1
        result()
        totalMoney()
            
        }
        else{
            if totMoney1 == 0 {
                zero = "Player 2 Wins the Dice Game" + "\nPlayer 1 has Insufficient Funds" + "\nPlease Restart the Game"
            }
            else{
                zero = "Player 1 Wins the Dice Game" + "\nPlayer 2 has Insufficient Funds" + "\nPlease Restart the Game"
            }
            
            let alert = UIAlertController(title: "STOP", message: zero, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(action)
            present(alert,animated: true,completion: nil)
        }
    }
    
    
    @IBAction func resetBtn(_ sender: UIButton) {
        
        round = 0
        roundBtn.text = "Round : \(round)"
        LeftImage.image = UIImage(named: "Dice1")
        RightImage.image = UIImage(named: "Dice1")
        LeftImage1.image = UIImage(named: "Dice1")
        RightImage1.image = UIImage(named: "Dice1")
        stepper1.value = 0
        stepper2.value = 0
        bet1.text = "BET :"
        bet2.text = "BET :"
        
        totMoney1 = 100
        totMoney2 = 100
        mLeft1.text = "MONEY LEFT: \(totMoney1)"
        mLeft2.text = "MONEY LEFT: \(totMoney2)"
    }
    
    
    @IBAction func betInc1(_ sender: UIStepper) {
        if (Int(stepper1.value) < totMoney1) {
        bet1.text = "BET : \(Int(stepper1.value))"
        }
        else{
            let alert = UIAlertController(title: "STOP", message: "BET money cannot exceed the MONEY LEFT" , preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(action)
            present(alert,animated: true,completion: nil)
        }
    }
    
    @IBAction func betInc2(_ sender: UIStepper) {
        if (Int(stepper2.value) < totMoney2) {
            bet2.text = "BET : \(Int(stepper2.value))"
        }
        else{
            let alert = UIAlertController(title: "STOP", message: "BET money cannot exceed the MONEY LEFT" , preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(action)
            present(alert,animated: true,completion: nil)
        }
    }
    
    
    func result(){
        
        if sum1 > sum2 {
            res = "Player 1 Wins"
        }
        else if sum2 > sum1{
            res = "player 2 Wins"
        }
        else{
            res = "Draw"
        }
    }
    
    func totalMoney(){
        if sum1 > sum2 {
            totMoney1 += Int(stepper1.value)
            totMoney2 -= Int(stepper2.value)
        }
        else if sum2 > sum1 {
            totMoney2 += Int(stepper2.value)
            totMoney1 -= Int(stepper1.value)
        }
        else{
            totMoney2 += 0
            totMoney1 += 0
        }
        
        mLeft1.text = "MONEY LEFT: \(totMoney1)"
        mLeft2.text = "MONEY LEFT: \(totMoney2)"
        
    }
    
    @IBAction func showAlert(){
        let message = "Player 1 sum = \(sum1)" + "\n Player 2 sum = \(sum2)"
        
        
        
        let alert = UIAlertController(title: res, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

