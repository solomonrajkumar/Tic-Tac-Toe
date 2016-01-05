//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Solomon Rajkumar on 22-12-15.
//  Copyright © 2015 SoluAppHouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 -> Cross; 2 -> Nought
    var activePlayer = 1
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]
    
    var countOfButtonClicks = 0
    
    var isGameActive = true
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var button7: UIButton!
    
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    @IBAction func playAgainAction(sender: AnyObject) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        countOfButtonClicks = 0
        
        isGameActive = true
        
        activePlayer = 1
        
        resultLabel.hidden = true
        
        resultLabel.center = CGPointMake(resultLabel.center.x - 500, resultLabel.center.y)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
        button1.setImage(nil, forState: .Normal)
        button2.setImage(nil, forState: .Normal)
        button3.setImage(nil, forState: .Normal)
        button4.setImage(nil, forState: .Normal)
        button5.setImage(nil, forState: .Normal)
        button6.setImage(nil, forState: .Normal)
        button7.setImage(nil, forState: .Normal)
        button8.setImage(nil, forState: .Normal)
        button9.setImage(nil, forState: .Normal)
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        //        let bottomFrame : CGRect = CGRectMake(0,button1.frame.size.height-10,button1.frame.size.width,1)
        //
        //        let bottomView : UIView = UIView(frame: bottomFrame)
        //
        //        //bottomView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        //        bottomView.backgroundColor = UIColor.redColor()
        //        button1.addSubview(bottomView)
        
        //button1.layer.cornerRadius = 1
        button1.layer.borderWidth = 3
        //button1.layer.borderColor = UIColor.blackColor().CGColor
        
        //button2.layer.cornerRadius = 1
        button2.layer.borderWidth = 3
        button2.layer.borderColor = UIColor.blackColor().CGColor
        
        //button3.layer.cornerRadius = 1
        button3.layer.borderWidth = 3
        button3.layer.borderColor = UIColor.blackColor().CGColor
        
        //button4.layer.cornerRadius = 1
        button4.layer.borderWidth = 3
        button4.layer.borderColor = UIColor.blackColor().CGColor
        
        //button5.layer.cornerRadius = 1
        button5.layer.borderWidth = 3
        button5.layer.borderColor = UIColor.blackColor().CGColor
        
        //button6.layer.cornerRadius = 1
        button6.layer.borderWidth = 3
        button6.layer.borderColor = UIColor.blackColor().CGColor
        
        //button7.layer.cornerRadius = 1
        button7.layer.borderWidth = 3
        button7.layer.borderColor = UIColor.blackColor().CGColor
        
        //button8.layer.cornerRadius = 1
        button8.layer.borderWidth = 3
        button8.layer.borderColor = UIColor.blackColor().CGColor
        
        //button9.layer.cornerRadius = 1
        button9.layer.borderWidth = 3
        button9.layer.borderColor = UIColor.blackColor().CGColor
        
        
        resultLabel.hidden = true
        
        resultLabel.center = CGPointMake(resultLabel.center.x - 500, resultLabel.center.y)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && isGameActive {
            
            gameState[sender.tag] = activePlayer
            
            countOfButtonClicks++
            
            if activePlayer == 1 {
                
                
                sender.setImage(UIImage(named: "TTT_x"), forState: .Normal)
                
                activePlayer = 2
                
            } else {
                
                sender.setImage(UIImage(named: "TTT_o"), forState: .Normal)
                
                activePlayer = 1
                
            }
            
            
            for winningCombination in winningCombinations {
                
                
                if( gameState[winningCombination[0]] != 0 && gameState[winningCombination[0]] == gameState[winningCombination[1]] && gameState[winningCombination[1]] == gameState[winningCombination[2]] ) {
                    
                    print(winningCombination)
                    print("Player \(gameState[winningCombination[0]]) wins !! ")
                    
                    if gameState[winningCombination[0]] == 1 {
                        
                        resultLabel.text = "Crosses have won!!"
                        
                    } else {
                        
                        resultLabel.text = "Noughts have won!!"
                        
                    }
                    
                    resultLabel.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                        self.resultLabel.center = CGPointMake(self.resultLabel.center.x + 500, self.resultLabel.center.y)
  
                        
                        
                    })
                    
                    
                    playAgainButton.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)
                        
                        
                        
                    })
                    
                    isGameActive = false
                    
                }
                
            }
            
        }
        
        if countOfButtonClicks == 9 {
            
            isGameActive = false
            
            resultLabel.text = "It is a draw!!"
            
            resultLabel.hidden = false
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                self.resultLabel.center = CGPointMake(self.resultLabel.center.x + 500, self.resultLabel.center.y)
                
                
                
            })
            
            playAgainButton.hidden = false
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)
                
                
                
            })
            
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
}

