//
//  SecondViewController.swift
//  test2
//
//  Created by Rae  Lasko on 10/28/15.
//  Copyright © 2015 Rae  Lasko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //initiate variables
    var actionsArray:[String] = []
    var experimentRecieve:String = "Experiment 1"
    var numbersArray: [Int] = []
    var number:Int = 10
    var lastButtonWasNumber:Bool = false
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
    var leftFlipArray = []
    var rightFlipArray = []
    var leftLeapArray = []
    var rightLeapArray = []
    var spinArray = []
    

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
        if lastButtonWasNumber == false{
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
        actionsArray.append("leftFlip")
        numbersArray.append(1)
        lastButtonWasNumber = false
    }
    
    @IBAction func didClickRightFlipButton(sender: AnyObject) {
        actionsArray.append("rightFlip")
        numbersArray.append(1)
        lastButtonWasNumber = false
    }
    
    @IBAction func didClickLeftLeapButton(sender: AnyObject) {
        actionsArray.append("leftLeap")
        numbersArray.append(1)
        lastButtonWasNumber = false
    }
    
    @IBAction func didClickRightLeapButton(sender: AnyObject) {
        actionsArray.append("rightLeap")
        numbersArray.append(1)
        lastButtonWasNumber = false
    }


    @IBAction func didClickSpinButton(sender: AnyObject) {
        actionsArray.append("spin")
        numbersArray.append(1)
        lastButtonWasNumber = false
    }

    
    //switch determines mystery funct.
    @IBAction func didClickMysteryButton(sender: AnyObject) {
        for (_,element) in numbersArray.enumerate(){
            numbersArray[element] = numbersArray[element]*2
        }
    }
    
    //clear actionsArray
    @IBAction func didClickClear(sender: AnyObject) {
        actionsArray = []
        numbersArray = []
    }
    
    //execute animation
    @IBAction func didClickGo(sender: AnyObject) {
        //display actionArray[element]*numbersArray[element]
        // need to change type of actionsArray to array
//        for element in 0...actionsArray.count {
//            actionsArray[element] = actionsArray[element] * numbersArray[element]
       // }
        startAnimating()

    }
    
    func startAnimating() {
        animationView.animationImages = pandaArray
        animationView.animationDuration = 3.0
        self.animationView.animationRepeatCount = 1
        animationView.startAnimating()
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
