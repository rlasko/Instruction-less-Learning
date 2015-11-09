//
//  SecondViewController.swift
//  test2
//
//  Created by Rae  Lasko on 10/28/15.
//  Copyright © 2015 Rae  Lasko. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    @IBOutlet weak var arrayLabel: UILabel!

    
    //initiate variables
    var actionsArray = Array<Array<UIImage>>()
    var experimentRecieve:String = "Experiment 1"
    var numbersArray: [Int] = []
    var number:Int = 10
    var lastButtonWasNumber:Bool = true
    var pandaArray = [
        UIImage(named: "panda1")!,
        UIImage(named: "panda2")!,
        UIImage(named: "panda3")!,
        UIImage(named: "panda4")!,
        UIImage(named: "panda5")!,
        UIImage(named: "panda6")!,
        UIImage(named: "panda7")!,
        UIImage(named: "panda8")!
    ]
    var leftFlipArray = [
        UIImage(named: "leftFlip")!,
        UIImage(named: "blank")!
    ]
    var rightFlipArray = [
        UIImage(named: "rightFlip")!,
        UIImage(named: "blank")!
    ]
    var leftLeapArray = [
        UIImage(named: "leftLeap")!,
        UIImage(named: "blank")!
    ]
    var rightLeapArray = [
        UIImage(named: "rightLeap")!,
        UIImage(named: "blank")!
    ]
    var spinArray = [
        UIImage(named: "spin")!,
        UIImage(named: "blank")!
    ]
    var playArray:[UIImage] = []

    

    @IBOutlet weak var animationView: UIImageView!
    
    //if any of number button clicked, change var number
    @IBAction func didClickZero(sender: AnyObject) {
        if lastButtonWasNumber == false{
            numbersArray.removeLast()
            numbersArray.append(0)
        }
        lastButtonWasNumber = true
    }
    @IBAction func didClickOne(sender: AnyObject) {
        if lastButtonWasNumber == false{
            numbersArray.removeLast()
            numbersArray.append(1)
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickTwo(sender: AnyObject) {
        if lastButtonWasNumber == false{
            numbersArray.removeLast()
            numbersArray.append(2)
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickThree(sender: AnyObject) {
        if lastButtonWasNumber == false{
            numbersArray.removeLast()
            numbersArray.append(3)
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickFour(sender: AnyObject) {
        if (!lastButtonWasNumber) {
            numbersArray.removeLast()
            numbersArray.append(4)
        }
        lastButtonWasNumber = true
    }

    @IBAction func didClickFive(sender: AnyObject) {
        if lastButtonWasNumber == false{
            numbersArray.removeLast()
            numbersArray.append(5)
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickSix(sender: AnyObject) {
        if lastButtonWasNumber == false{
            numbersArray.removeLast()
            numbersArray.append(6)
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickSeven(sender: AnyObject) {
        if lastButtonWasNumber == false{
            numbersArray.append(7)
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickEight(sender: AnyObject) {
        if lastButtonWasNumber == false{
            numbersArray.removeLast()
            numbersArray.append(8)
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickNine(sender: AnyObject) {
        if lastButtonWasNumber == false{
            numbersArray.removeLast()
            numbersArray.append(9)
        }
        lastButtonWasNumber = true
    }
    
    //if any action button clicked, change bool
    @IBAction func didClickLeftFlipButton(sender: AnyObject) {
        actionsArray.append(leftFlipArray)
        numbersArray.append(1)
        lastButtonWasNumber = false
    }
    
    @IBAction func didClickRightFlipButton(sender: AnyObject) {
        actionsArray.append(rightFlipArray)
        numbersArray.append(1)
        lastButtonWasNumber = false
    }
    
    @IBAction func didClickLeftLeapButton(sender: AnyObject) {
        actionsArray.append(leftLeapArray)
        numbersArray.append(1)
        lastButtonWasNumber = false
    }
    
    @IBAction func didClickRightLeapButton(sender: AnyObject) {
        actionsArray.append(rightLeapArray)
        numbersArray.append(1)
        lastButtonWasNumber = false
    }


    @IBAction func didClickSpinButton(sender: AnyObject) {
        actionsArray.append(spinArray)
        numbersArray.append(1)
        lastButtonWasNumber = false
    }

    
    //switch determines mystery funct.
    @IBAction func didClickMysteryButton(sender: AnyObject) {
        for (_,element) in numbersArray.enumerate(){
            numbersArray[element] = numbersArray[element]*2
        }
        //handles exception - cannot select number after this button
        lastButtonWasNumber = true
    }
    
    //clear actionsArray
    @IBAction func didClickClear(sender: AnyObject) {
        actionsArray = []
        numbersArray = []
        
        //handles exception - sequence must begin with action
        lastButtonWasNumber = true
    }
    
    //execute animation
    @IBAction func didClickGo(sender: AnyObject) {
        startAnimating()
        
        
        //handles exception - sequence must begin with action
        lastButtonWasNumber = true

    }
    
    func startAnimating() {
        //check that there are valid inputs for both arrays
        if actionsArray.count >= 1 && actionsArray.count == numbersArray.count {
            //iterate through actions array, each element is a single action
            for element in 0...actionsArray.count-1{
                //play that action the number of times denoted in matching index of numbers array
                for _ in 0...numbersArray[element]-1{
                    animationView.animationImages = actionsArray[element]
                    animationView.animationDuration = 2.0
                    self.animationView.animationRepeatCount = 1
                }
            }
            animationView.startAnimating()
        }else{
            animationView.image = UIImage(named: "panda1")
            animationView.animationDuration = 1.0
        }
    }
    
    //Add switch case to run action array

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
