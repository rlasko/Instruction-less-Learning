//
//  SecondViewController.swift
//  test2
//
//  Created by Rae Lasko on 10/28/15.
//  Copyright © 2015 Rae Lasko. All rights reserved.
//

import UIKit
import AVFoundation
import MessageUI
import Foundation

extension String{
    func stringByAppendingPathExtension(ext: String) -> String? {
        
        let nsSt = self as NSString
        
        return nsSt.stringByAppendingPathExtension(ext)
    }
}

class SecondViewController: UIViewController, MFMailComposeViewControllerDelegate {

    
    func dataFilePath() -> String {
        var paths:Array = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentsDirectory:String = paths[0]
         let docs = documentsDirectory.stringByAppendingPathExtension("myfile.csv")!
       
        return docs
    }
    
    @IBAction func exportButton(sender: AnyObject) {
        if !NSFileManager.defaultManager().fileExistsAtPath(self.dataFilePath()){
        NSFileManager.defaultManager().createFileAtPath(self.dataFilePath(), contents: nil, attributes: nil)
        NSLog("Routo creato")
        }
        
        var writeString:String = String(stringInterpolationSegment: 0)
        
        
        for i in 0..<exportArray.count{
            var current:String = "Actions = "
            
            //var theActionArray = [(action:Action, number: Int)]
            let theActionArray = exportArray[i].arr
            var strToWrite:(action:String,number:Int) = ("hello",0)
            for i in theActionArray{
    
                switch (i.action){
                case .LF:
                    strToWrite = ("Left Flip",i.number)
                case .RF:
                    strToWrite = ("Right Flip",i.number)
                case .LL:
                    strToWrite = ("Left Leap",i.number)
                case .RL:
                    strToWrite = ("Right Leap",i.number)
                case .S:
                    strToWrite = ("Spin",i.number)
                }
                current = current + "Action = " + strToWrite.action + "Number = " + String(strToWrite.number)
            }

            current += "mystery = " + String(exportArray[i].mystery)
            writeString += current
        }
        
            NSLog("writeString: %@)", writeString)
     
        do {
            try writeString.writeToFile(dataFilePath(), atomically: true, encoding: NSUTF8StringEncoding)

        } catch {
            print((error as NSError).description)
        }
            
       //send email
        
        if( MFMailComposeViewController.canSendMail() ) {
            var mailComposer = AppDelegate().mailViewController
            
            mailComposer.sendMailTo([], subject: subjectString, attachment: NSData(contentsOfFile: dataFilePath())!, body: "This is an email from Carnegie Mellon Department of Psychology containing research data", fromViewController: self)
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        if let aError = error {
            print(aError)
        }
        
        switch (result) {
        case MFMailComposeResultCancelled:
            break
            
        case MFMailComposeResultSaved:
            break
            
        default: break
        }
        controller.dismissViewControllerAnimated(true) { () -> Void in
        }
    }
    
    @IBOutlet weak var arrayLabel: UILabel!
    
    //Subject ID
    var subjectString:String = "None"
    
    //create type to record user selected actions
    enum Action {
        case LF, RF, LL, RL, S
    }
    
    //initiate variables
    
    //Holds sequence as it is being entered by user
    var actionsArray = [(action: Action, number: Int)]()
    
    //Initialize array to export to txt file
    var exportArray = [
        (arr:[(action:Action, number: Int)],mystery:Int)
            ]()
    
    //initialize mystery button
    var mysteryNum: Int = 0
    
    //recieves data from ViewController. Determines function of mystery key
    var experimentRecieved:Int = 0
    
    var number:Int = 10
    
    var n:Int = 21
    
    //Checks that inputs are syntatically correct
    var lastButtonWasNumber:Bool = true
    
    var mysterySelected:Bool = false
    
    //Will display in case of error
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
    
    //Arrays of animation sequences
    var leftFlipArray = [
        UIImage(named: "LF0")!,
        UIImage(named: "LF1")!,
        UIImage(named: "LF2")!,
        UIImage(named: "LF3")!,
        UIImage(named: "LF4")!,
        UIImage(named: "LF5")!,
        UIImage(named: "LF6")!,
        UIImage(named: "LF7")!,
        UIImage(named: "LF8")!,
        UIImage(named: "LF9")!,
        UIImage(named: "LF10")!,
        UIImage(named: "LF11")!,
        UIImage(named: "LF12")!,
        UIImage(named: "LF13")!,
        UIImage(named: "LF14")!
    ]
    var rightFlipArray = [
        UIImage(named: "RF0")!,
        UIImage(named: "RF1")!,
        UIImage(named: "RF2")!,
        UIImage(named: "RF3")!,
        UIImage(named: "RF4")!,
        UIImage(named: "RF5")!,
        UIImage(named: "RF6")!,
        UIImage(named: "RF7")!,
        UIImage(named: "RF8")!,
        UIImage(named: "RF9")!,
        UIImage(named: "RF10")!,
        UIImage(named: "RF11")!,
        UIImage(named: "RF12")!,
        UIImage(named: "RF13")!,
        UIImage(named: "RF14")!
    ]
    var leftLeapArray = [
        UIImage(named: "LL0")!,
        UIImage(named: "LL1")!,
        UIImage(named: "LL2")!,
        UIImage(named: "LL3")!,
        UIImage(named: "LL4")!,
        UIImage(named: "LL5")!,
        UIImage(named: "LL6")!,
        UIImage(named: "LL7")!,
        UIImage(named: "LL8")!,
        UIImage(named: "LL9")!,
        UIImage(named: "LL10")!,
        UIImage(named: "LL11")!,
        UIImage(named: "LL12")!,
        UIImage(named: "LL13")!,
        UIImage(named: "LL14")!,
        UIImage(named: "LL15")!,
        UIImage(named: "LL16")!,
        UIImage(named: "LL17")!,
        UIImage(named: "LL18")!,
        UIImage(named: "LL19")!,
        UIImage(named: "LL20")!,
        UIImage(named: "LL21")!,
        UIImage(named: "LL22")!,
        UIImage(named: "LL23")!,
        UIImage(named: "LL24")!,
        UIImage(named: "LL25")!,
        UIImage(named: "LL26")!,
        UIImage(named: "LL27")!,
        UIImage(named: "LL28")!,
        UIImage(named: "LL29")!,
        UIImage(named: "LL30")!
    ]
    var rightLeapArray = [
        UIImage(named: "RL0")!,
        UIImage(named: "RL1")!,
        UIImage(named: "RL2")!,
        UIImage(named: "RL3")!,
        UIImage(named: "RL4")!,
        UIImage(named: "RL5")!,
        UIImage(named: "RL6")!,
        UIImage(named: "RL7")!,
        UIImage(named: "RL8")!,
        UIImage(named: "RL9")!,
        UIImage(named: "RL10")!,
        UIImage(named: "RL11")!,
        UIImage(named: "RL12")!,
        UIImage(named: "RL13")!,
        UIImage(named: "RL14")!,
        UIImage(named: "RL15")!,
        UIImage(named: "RL16")!,
        UIImage(named: "RL17")!,
        UIImage(named: "RL18")!,
        UIImage(named: "RL19")!,
        UIImage(named: "RL20")!,
        UIImage(named: "RL21")!,
        UIImage(named: "RL22")!,
        UIImage(named: "RL23")!,
        UIImage(named: "RL24")!,
        UIImage(named: "RL25")!,
        UIImage(named: "RL26")!,
        UIImage(named: "RL27")!,
        UIImage(named: "RL28")!,
        UIImage(named: "RL29")!,
        UIImage(named: "RL30")!
    ]
    var spinArray = [
        UIImage(named: "0")!,
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
        UIImage(named: "6")!,
        UIImage(named: "7")!,
        UIImage(named: "8")!,
        UIImage(named: "9")!,
        UIImage(named: "10")!,
        UIImage(named: "11")!
    ]
    
    
    var approveSound =  NSBundle.mainBundle().URLForResource("beep", withExtension: "mp3")!
    var audioPlayer = AVAudioPlayer()
    
    //Assists in animating by holding the animation that should currently by animated
    var currentActionArray:[UIImage] = [
        UIImage(named: "panda1")!
    ]
    
    //Populated after Go is pressed. Actions and numbers removed from tuples in actionsArray
    var playActionArray: [Action] = []
    
    

    @IBOutlet weak var animationView: UIImageView!
    
    //if any of number button clicked, change var number
      @IBAction func didClickOne(sender: AnyObject) {
        if !lastButtonWasNumber {
            if !mysterySelected{
                actionsArray[actionsArray.count-1].number = 1
            }else{
                n = 1
                doMysteryVal()
                mysterySelected = false
            }
            audioPlayer.play()

        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickTwo(sender: AnyObject) {
        if !lastButtonWasNumber {
            if !mysterySelected{
                actionsArray[actionsArray.count-1].number = 2
        }else{
            n = 2
            doMysteryVal()
                mysterySelected = false
        }
            audioPlayer.play()
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickThree(sender: AnyObject) {
        if !lastButtonWasNumber{
            if !mysterySelected{
                actionsArray[actionsArray.count-1].number = 3
        }else{
            n = 3
            doMysteryVal()
            mysterySelected = false
        }
            audioPlayer.play()
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickFour(sender: AnyObject) {
        if (!lastButtonWasNumber) {
            if !mysterySelected{
            actionsArray[actionsArray.count-1].number = 4
            }else{
                n = 4
                doMysteryVal()
                mysterySelected = false
            }
            audioPlayer.play()
        }
        lastButtonWasNumber = true
    }

    @IBAction func didClickFive(sender: AnyObject) {
        if !lastButtonWasNumber{
            if !mysterySelected{
                actionsArray[actionsArray.count-1].number = 5
            }else{
                n = 5
                doMysteryVal()
                mysterySelected = false
            }
            audioPlayer.play()
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickSix(sender: AnyObject) {
        if !lastButtonWasNumber{
            if !mysterySelected{
                actionsArray[actionsArray.count-1].number = 6
            }else{
                n = 6
                doMysteryVal()
                mysterySelected = false
            }
            audioPlayer.play()
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickSeven(sender: AnyObject) {
        if !lastButtonWasNumber{
            if !mysterySelected{
            actionsArray[actionsArray.count-1].number = 7
            }else{
                n = 7
                doMysteryVal()
                mysterySelected = false
            }
            audioPlayer.play()
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickEight(sender: AnyObject) {
        if !lastButtonWasNumber{
            if !mysterySelected{
            actionsArray[actionsArray.count-1].number = 8
            }else{
                n = 8
                doMysteryVal()
                mysterySelected = false
            }
            audioPlayer.play()
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickNine(sender: AnyObject) {
        if !lastButtonWasNumber{
            if !mysterySelected{
            actionsArray[actionsArray.count-1].number = 9
            }else{
                n = 9
                doMysteryVal()
                mysterySelected = false
            }
            audioPlayer.play()
        }
        lastButtonWasNumber = true
    }
    
    //if any action button clicked, change bool
    @IBAction func didClickLeftFlipButton(sender: AnyObject) {
        if lastButtonWasNumber{
        actionsArray.append((.LF,0))
        audioPlayer.play()
        lastButtonWasNumber = false
        }
    }
    
    @IBAction func didClickRightFlipButton(sender: AnyObject) {
        if lastButtonWasNumber{

        actionsArray.append((.RF,0))
        audioPlayer.play()
        lastButtonWasNumber = false

        }
    }
    
    @IBAction func didClickLeftLeapButton(sender: AnyObject) {
        if lastButtonWasNumber{
        actionsArray.append((.LL,0))
        audioPlayer.play()
        lastButtonWasNumber = false
        }
    }
    
    @IBAction func didClickRightLeapButton(sender: AnyObject) {
        if lastButtonWasNumber{
        actionsArray.append((.RL,0))
        audioPlayer.play()
        lastButtonWasNumber = false
    }
    }

    @IBAction func didClickSpinButton(sender: AnyObject) {
        if lastButtonWasNumber{
            actionsArray.append((.S,0))
        audioPlayer.play()
        lastButtonWasNumber = false
    }
    }
    
    //switch determines mystery function
    @IBAction func didClickMysteryButton(sender: AnyObject) {
        if lastButtonWasNumber{
        audioPlayer.play()
        mysteryNum += 1
                //handles logical exception - cannot select number after this button
        lastButtonWasNumber = false
        mysterySelected = true
    }
    }

    func doMysteryVal(){
        switch experimentRecieved{
        //Repeat the immediately prior step N times.
        case 1:
            if actionsArray.count > 0{
                var lastNumber = actionsArray.last!.number
                lastNumber = lastNumber * n
                actionsArray[actionsArray.count - 1].number = lastNumber
            }
        //Repeat the entire prior program, N times.
        case 2:
            let tempArray = actionsArray
            if n != 1{
                for _ in 2...n{
                    actionsArray += tempArray
                }
            }
        //Repeat the most recent N steps once.
        case 3:
            if actionsArray.count >= n{
                for x in 1...n{
                    actionsArray[actionsArray.count-x].number += actionsArray[actionsArray.count - x].number
                }
            }
        //Repeat the first N steps once.
        case 4:
            if actionsArray.count >= n{
                for x in 1...n{
                    actionsArray[x].number += actionsArray[x].number
                }
            }
        //Repeat the Nth step from the start of the program once.
        case 5:
            if actionsArray.count >= n{
                actionsArray[n].number += actionsArray[n].number
            }
        //Repeat the Nth step from the end of the program once.
        case 6:
            if actionsArray.count >= n{
                actionsArray[actionsArray.count - n].number += actionsArray[actionsArray.count - n].number
            }
        default:
            animationView.image = UIImage(named: "White")
        }
        
    }

    //execute animation
    @IBAction func didClickGo(sender: AnyObject) {
        if lastButtonWasNumber{
        audioPlayer.play()
        exportArray.append((actionsArray,mysteryNum))
        //Reset mysteryNum
        mysteryNum = 0
        
        //appends actions to playActions array from actionsArray. Removes elements from tuples --> type action
        for (action,number) in actionsArray {
            if number != 0{
            for _ in 1...number {
            playActionArray.append(action)
                }
            }
        }
            
            var finalArray:[UIImage] = []
            for action in playActionArray{
                switch action{
                case .LF:
                    finalArray += leftFlipArray
                case .RF:
                    finalArray += rightFlipArray
                case .LL:
                    finalArray += leftLeapArray
                case .RL:
                    finalArray += rightLeapArray
                case .S:
                    finalArray += spinArray
                }
            }
        actionsArray = []
        if finalArray.count > 0{self.animateAction(finalArray)}
        playActionArray = []

        //handles logical exception - sequence must begin with action
        lastButtonWasNumber = true
        }
    }
    
    func animateAction(action:[UIImage], i:Int = 0, dur:Double = 0.12){
        UIView.transitionWithView(self.animationView, duration: dur, options: UIViewAnimationOptions.TransitionCrossDissolve, animations:
            { () -> Void in self.animationView.image = action[i]
        }) { (completion) -> Void in
            if i < action.count-1{
                self.animateAction(action,i:i+1)
            }
        }
    }
    
    func loadImage(image:[UIImage], i:Int = 0){
        UIView.animateWithDuration(0, animations: { () -> Void in self.animationView.image = image[i]})
        {(completion) -> Void in
            if i < image.count-1{
                self.loadImage(image, i:i+1)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        self.animationView.image = UIImage(named: "11")!
        
        try! audioPlayer = AVAudioPlayer(contentsOfURL: approveSound, fileTypeHint: nil)
        audioPlayer.prepareToPlay()
        
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

