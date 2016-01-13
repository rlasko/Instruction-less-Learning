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
            

            let current:String = String(exportArray[i].arr) + String(exportArray[i].mystery)
            
            writeString += current
        }
        
            NSLog("writeString: %@)", writeString)
        
//            let handle = NSFileHandle(forWritingAtPath: self.dataFilePath())
//        
//            handle!.truncateFileAtOffset(handle!.seekToEndOfFile())
//            handle!.writeData(writeString.dataUsingEncoding(NSUTF8StringEncoding)!)
//            handle!.readDataToEndOfFile()
//        
        do {
            try writeString.writeToFile(dataFilePath(), atomically: true, encoding: NSUTF8StringEncoding)

        } catch {
            print((error as NSError).description)
        }

            
       //send email
        
        if( MFMailComposeViewController.canSendMail() ) {
            
//            let mailComposer = MFMailComposeViewController()
            var mailComposer = AppDelegate().mailViewController.sendMailTo([], subject: "uo", attachment: NSData(contentsOfFile: dataFilePath())!, body: "up", fromViewController: self)
            
//            mailComposer.mailComposeDelegate = self
//            
//            //Set the subject and message of the email
//            mailComposer.setSubject(subjectString)
//            mailComposer.setMessageBody("", isHTML: true)
//            
//            
//                let fileData = NSData(contentsOfFile: dataFilePath())
////            
//            mailComposer.addAttachmentData(fileData!, mimeType: "text/plain", fileName: "myfile.txt")
//
//            
//            navigationController!.presentViewController(mailComposer, animated: true, completion: nil)
//        }
        
        func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
            controller.dismissViewControllerAnimated(true, completion: nil)
            NSLog("%@", error)
            
        }
    
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
    
    //Checks that inputs are syntatically correct
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
            actionsArray[actionsArray.count-1].number = 1
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickTwo(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[actionsArray.count-1].number = 2
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickThree(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[actionsArray.count-1].number = 3
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickFour(sender: AnyObject) {
        if (!lastButtonWasNumber) {
            actionsArray[actionsArray.count-1].number = 4
        }
        lastButtonWasNumber = true
    }

    @IBAction func didClickFive(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[actionsArray.count-1].number = 5
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickSix(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[actionsArray.count-1].number = 6
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickSeven(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[actionsArray.count-1].number = 7
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickEight(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[actionsArray.count-1].number = 8
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickNine(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[actionsArray.count-1].number = 9
        }
        lastButtonWasNumber = true
    }
    
    //if any action button clicked, change bool
    @IBAction func didClickLeftFlipButton(sender: AnyObject) {
        actionsArray.append((.LF,0))
        lastButtonWasNumber = false
    }
    
    @IBAction func didClickRightFlipButton(sender: AnyObject) {
        actionsArray.append((.RF,0))
        lastButtonWasNumber = false
    }
    
    @IBAction func didClickLeftLeapButton(sender: AnyObject) {
        actionsArray.append((.LL,0))
        lastButtonWasNumber = false
    }
    
    @IBAction func didClickRightLeapButton(sender: AnyObject) {
        actionsArray.append((.RL,0))
        lastButtonWasNumber = false
    }


    @IBAction func didClickSpinButton(sender: AnyObject) {
        actionsArray.append((.S,0))
        lastButtonWasNumber = false
    }

    
    //switch determines mystery function
    @IBAction func didClickMysteryButton(sender: AnyObject) {
        
        mysteryNum += 1
        
        if mysteryNum == 1{
        exportArray.append((actionsArray,0))
        }
        
        
        switch experimentRecieved{
            
            //play animation twice
            case 1:
                actionsArray += actionsArray
            
            //play each element 3 times denoted ie axyz --> aaaxxxyyyzzz
            case 2:
                for (_, var repeats) in actionsArray{
                    repeats = repeats*3
            }
            
            //play the second to last element twice indicated ie axyz --> axyyz
            case 3:
                if actionsArray.count > 2{
                    actionsArray[actionsArray.count - 2].number = actionsArray[actionsArray.count - 2].number * 2
            }
            
            //play the second element twice the indicated ie axyz --> axxyz
            case 4:
                if actionsArray.count > 2 {
                    actionsArray[1].number = actionsArray[1].number * 2
            }
            
            //play each element 3 times denoted ie axyz --> aaxxyyzz
            case 5:
                for (_, var repeats) in actionsArray{
                    repeats = repeats*2
            }
        default:
            animationView.image = UIImage(named: "White")
            
        }

        //handles logical exception - cannot select number after this button
        lastButtonWasNumber = true
    }
    

    //execute animation
    @IBAction func didClickGo(sender: AnyObject) {
        if lastButtonWasNumber{
        audioPlayer.play()
        
        
        /* If mysteryNum is greater than zero, then user has clicked mystery num. If user has clicked mysteryNum
            then actionsArray was already appended to exportArray. Now add the corresponding mysteryNum
            This allows the user to click mystery multiple times.
            */
        if mysteryNum > 0 {
            exportArray[exportArray.count - 1].mystery = mysteryNum
        }else{
            //In the case that mysteryNum is 0, append mysteryNum
            exportArray.append((actionsArray,0))
        }
        
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
        animateLabel();
        actionsArray = []

        
        
        //handles logical exception - sequence must begin with action
        lastButtonWasNumber = false
        }
    }
    
    
    func animateLabel() {
        
        //When playActionArray is empty, stop the recursive calls
        guard !playActionArray.isEmpty else {
            return
        }
        
        //initialize currentAction to the first element in playActionArray
        let currentAction:Action = playActionArray.first!
        
        
        //Change the currentActionArray to the correct one based on the action that is denoted in playActionArray
        switch currentAction{
        case .LF:
            currentActionArray = leftFlipArray
        case .RF:
            currentActionArray = rightFlipArray
        case .LL:
            currentActionArray = leftLeapArray
        case .RL:
            currentActionArray = rightLeapArray
        case .S:
            currentActionArray = spinArray
        }
        
        
        //Play animation from playActionArray
        //currentActionArray contains the array of the animation sequence that is currently playing
        //Recursively calls animateLabel() until playActionArray is empty
        
        UIView.transitionWithView(animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
            self.animationView.image = self.currentActionArray[0]
            }) { (completion) -> Void in
                
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[1]
                    }) { (completion) -> Void in
                        
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[2]
                    }) { (completion) -> Void in
                                
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[3]
                    }) { (completion) -> Void in
                                        
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[4]
                    }) { (completion) -> Void in
            
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[5]
                    }) { (completion) -> Void in
            
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[6]
                    }) { (completion) -> Void in
                    
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[7]
                    }) { (completion) -> Void in
                        
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[8]
                    }) { (completion) -> Void in
            
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[9]
                    }) { (completion) -> Void in
                    
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                   self.animationView.image = self.currentActionArray[10]
                   }) { (completion) -> Void in
                   
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[11]
                    }) { (completion) -> Void in
                        if self.currentActionArray.count > 12{
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[12]
                    }) { (completion) -> Void in
                    
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[13]
                    }) { (completion) -> Void in
                        
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[14]
                    }) { (completion) -> Void in
                        if self.currentActionArray.count > 15{
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[15]
                    }) { (completion) -> Void in
                
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[16]
                    }) { (completion) -> Void in
                    
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[17]
                    }) { (completion) -> Void in
            
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[18]
                    }) { (completion) -> Void in
            
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[19]
                    }) { (completion) -> Void in
            
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[20]
                    }) { (completion) -> Void in
                        
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[21]
                    }) { (completion) -> Void in
                    
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[22]
                    }) { (completion) -> Void in
                    
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[23]
                    }) { (completion) -> Void in
                    
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[24]
                    }) { (completion) -> Void in
                    
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[25]
                    }) { (completion) -> Void in
                        
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[26]
                    }) { (completion) -> Void in
                    
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[27]
                    }) { (completion) -> Void in
                    
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[28]
                    }) { (completion) -> Void in
            
            UIView.transitionWithView(self.animationView, duration: 0.06, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                    self.animationView.image = self.currentActionArray[29]
                    }) { (completion) -> Void in
                            self.animationView.image = self.currentActionArray[30]
                        self.playActionArray.removeFirst()
                        self.animateLabel()
                        }}
                        
                        
                                                                                        }
                                                                                }
                                                                        }
                                                                }
                                                        }
                                                }
                                        }
                                }
                        }
                                                                        }
                                                                }
                                                        }
                                                }
                        }else{
                            self.playActionArray.removeFirst()
                            self.animateLabel()
                        }
                                }
                        }
                                                                                                                }
                        }else{
                            self.playActionArray.removeFirst()
                            self.animateLabel()
                        }
                                                                                                }
                                                                                        }
                                                                                }
                                                                        }
                                                                }
                                                        }
                                                }
                                        }
                                }
                        }
                }
                

            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        self.animationView.image = UIImage(named: "11")!
        
        try! audioPlayer = AVAudioPlayer(contentsOfURL: approveSound, fileTypeHint: nil)
        audioPlayer.prepareToPlay()
        
        

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

