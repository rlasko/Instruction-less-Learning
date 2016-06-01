//
//  ViewController.swift
//  test2
//
//  Created by Rae  Lasko on 10/23/15.
//  Copyright © 2015 Rae  Lasko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
   

    var subject:String = "Error: Did Not Enter Subject ID"
    
    @IBOutlet weak var pickerViewExp: UIPickerView!
    
    @IBOutlet weak var pickerViewNumber: UIPickerView!
    let pickerViewData: [String] = ["Repeat the immediately prior step N times", "Repeat the entire prior program, N times", "Repeat the most recent N steps once", "Repeat the first N steps once", "Repeat the Nth step from the start of the program once", "Repeat the Nth step from the end of the program once"]
    let pickerViewNumberData:[Int] = [1,2,3,4,5,6,7,8,9]
    
    var experiment:Int = 1
    
    @IBOutlet weak var subjectID: UITextField!
    

    
    @IBAction func input(sender : UITextField) {
        
        
        subject = sender.text!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Connect Picker
        self.pickerViewExp.delegate = self
        self.pickerViewExp.dataSource = self
        
        //Create Picker Array

    }
    

    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    

    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch (pickerView){
        case pickerViewExp:
            return pickerViewData.count
        case pickerViewNumber:
            return pickerViewNumberData.count
        default:
            return 6
        }
        
    }
    



    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView
    {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.whiteColor()
        pickerLabel.text = pickerViewData[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        pickerLabel.font = UIFont(name: "Apple SD Gothic Neo", size: 20) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.Center
        return pickerLabel
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        experiment = row + 1

    }
    

    
    //Send data to SecondViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondVC: SecondViewController = segue.destinationViewController as! SecondViewController

        secondVC.experimentRecieved = experiment
        secondVC.subjectString = String(subjectID.text)
        
    }
    
    //lower keyboard on touch elsewhere
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        self.subjectID.backgroundColor = UIColor.grayColor()

        
    }
    
    override func viewWillDisappear(animated: Bool) {
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
}