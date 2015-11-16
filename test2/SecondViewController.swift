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
    var actionsArray = [(action: String, number: Int)]()
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
    let timeDuration:Double = 1
    var repeatAction:Int = 1
    var currentActionArray:[UIImage] = [
        UIImage(named: "panda1")!
    ]

    

    @IBOutlet weak var animationView: UIImageView!
    
    //if any of number button clicked, change var number
    @IBAction func didClickZero(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[0].number = 0
        }
        lastButtonWasNumber = true
    }
    @IBAction func didClickOne(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[0].number = 1
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickTwo(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[0].number = 2
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickThree(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[0].number = 3
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickFour(sender: AnyObject) {
        if (!lastButtonWasNumber) {
            actionsArray[0].number = 4
        }
        lastButtonWasNumber = true
    }

    @IBAction func didClickFive(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[0].number = 5
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickSix(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[0].number = 6
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickSeven(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[0].number = 7
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickEight(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[0].number = 8
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickNine(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[0].number = 9
        }
        lastButtonWasNumber = true
    }
    
    //if any action button clicked, change bool
    @IBAction func didClickLeftFlipButton(sender: AnyObject) {
        actionsArray.append(("LF",1))
        lastButtonWasNumber = false
    }
    
    @IBAction func didClickRightFlipButton(sender: AnyObject) {
        actionsArray.append(("RF",1))
        lastButtonWasNumber = false
    }
    
    @IBAction func didClickLeftLeapButton(sender: AnyObject) {
        actionsArray.append(("LL",1))
        lastButtonWasNumber = false
    }
    
    @IBAction func didClickRightLeapButton(sender: AnyObject) {
        actionsArray.append(("RL",1))
        lastButtonWasNumber = false
    }


    @IBAction func didClickSpinButton(sender: AnyObject) {
        actionsArray.append(("S",1))
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
        animateeee()

        
        
        //handles exception - sequence must begin with action
        lastButtonWasNumber = true

    }
    
    
    func animationViewAnimateImages(action:String, index:Int = 0, completion:(Bool)->Void) {
        
        
//        switch action {
//        case "LF":
//            self.animationView.animationImages = self.leftFlipArray
//            self.animationView.animationDuration = 2.0
//            self.animationView.animationRepeatCount = self.number
//        case "RF":
//            self.animationView.animationImages = self.leftFlipArray
//            self.animationView.animationDuration = 2.0
//            self.animationView.animationRepeatCount = self.number
//        case "LL":
//            self.animationView.animationImages = self.leftFlipArray
//            self.animationView.animationDuration = 2.0
//            self.animationView.animationRepeatCount = self.number
//        case "RL":
//            self.animationView.animationImages = self.leftFlipArray
//            self.animationView.animationDuration = 2.0
//            self.animationView.animationRepeatCount = self.number
//        case "S":
//            self.animationView.animationImages = self.leftFlipArray
//            self.animationView.animationDuration = 2.0
//            self.animationView.animationRepeatCount = self.number
//        default:
//            self.animationView.image = UIImage(named: "panda1")
//        }
        

        
//        let currentImage = leftFlipArray[index]
//        UIView.animateWithDuration(2, delay: 0, options: <#T##UIViewAnimationOptions#>, animations: { () -> Void in
//            self.animationView.image
//            }) { (<#Bool#>) -> Void in
//            <#code#>
//        }
//        
//        
//
//        
    
        
//        UIView.animateWithDuration(20, options: UIViewAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
//            self.animationView.image = currentImage
//            }) { (completed) -> Void in
//                self.animationView.image = nil
//                if index+1 < self.leftFlipArray.count {
//                    self.animationViewAnimateImages(action, index: index+1, completion: { (_) -> Void in
//                        
//                    })
//                } else {
//                    completion(true)
//                    
//                }
//        }
    }
    
    func imageAnim() {
        self.animationView.animationImages = currentActionArray
        self.animationView.animationDuration = timeDuration * Double(repeatAction)
        self.animationView.animationRepeatCount = repeatAction
        animationView.startAnimating()
    }
    
    func animateeee(i:Int = 0) {
        
        guard i < actionsArray.count && !actionsArray.isEmpty else {
            return
        }
        let time:dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(timeDuration * Double(repeatAction)) * Int64(NSEC_PER_SEC))
        
        var currentAction:String = actionsArray[i].action
        repeatAction = actionsArray[i].number

        switch currentAction{
            
        case "LF":
            currentActionArray = leftFlipArray
        case "RF":
            currentActionArray = rightFlipArray
        case "LL":
            currentActionArray = leftLeapArray
        case "RL":
            currentActionArray = rightLeapArray
        case "S":
            currentActionArray = spinArray
        default:
            animationView.image = UIImage(named: "panda1")
        
        }
        
        imageAnim()
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            self.animateeee(i+1)
        }
    }
    

    
//    func startAnimating() {
//        
//
//        for (action, number) in actionsArray{
//            switch action{
//                
//            case "LF":
//                animationView.animationImages = leftFlipArray
//                animationView.animationDuration = 2.0
//                self.animationView.animationRepeatCount = number
//            case "RF":
//                animationView.animationImages = rightFlipArray
//                animationView.animationDuration = 2.0
//                self.animationView.animationRepeatCount = number
//            case "LL":
//                animationView.animationImages = leftLeapArray
//                animationView.animationDuration = 2.0
//                self.animationView.animationRepeatCount = number
//            case "RL":
//                animationView.animationImages = rightLeapArray
//                animationView.animationDuration = 2.0
//                self.animationView.animationRepeatCount = number
//            case "S":
//                animationView.animationImages = spinArray
//                animationView.animationDuration = 2.0
//                self.animationView.animationRepeatCount = number
//            default:
//                animationView.image = UIImage(named: "panda1")
//            }
//            
//            
//        }
//        
//    }

    
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
