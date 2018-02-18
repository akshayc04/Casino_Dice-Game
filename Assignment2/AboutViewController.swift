//
//  AboutViewController.swift
//  Assignment2
//
//  Created by Akshay on 2/15/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    
    
    @IBOutlet weak var gameRules: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameRules.text = "\n1) 2 Player Dice Game.\n" + "\n2) Each Player has 2 dice\n" + "\n3)Each Player is given $100 as a initial amount.\n" + "\n4) Each Player can bet an amount <= Total money he is left with.\n" + "\n5) Once both players set their bet amount - ROLL THE DICE !!\n" + "\n6) The sum of dices of each player is calculated.\n" + "\n7) The Player with Highest sum for the round wins that round\n" + "\n8) Player who wins - the amount he bet adds to his total money\n" + "\n9) Player who loses - the amount he bet gets reduced from his total money\n" + "\n10) Player who's total money becomes 0 first losses the game"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Aboutbackbutton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
