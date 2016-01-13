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
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var pickerViewNumber: UIPickerView!
    var pickerViewData: [String] = [String]()
    var pickerViewNumberData:[Int] = [Int]()
    
    var experiment:Int = 0
    
    @IBOutlet weak var subjectID: UITextField!
    

    
    @IBAction func input(sender : UITextField) {
        subject = String(subjectID.text)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Connect Picker
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.pickerViewNumber.delegate = self
        self.pickerViewNumber.dataSource = self
        
        //Create Picker Array
        pickerViewData = ["Experiment 1", "Experiment 2", "Experiment 3", "Experiment 4", "Experiment 5"]
        pickerViewNumberData = [1,2,3,4,5,6,7,8,9]
    }
    

    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func numberOfComponentsInPickerViewNumber(pickerViewNumber: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count
    }
    
    func pickerViewNumber(pickerViewNumber: UIPickerView, numberOfRowsInComponent component2: Int) -> Int {
        return pickerViewNumberData.count
    }

    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView
    {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.whiteColor()
        pickerLabel.text = pickerViewData[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        pickerLabel.font = UIFont(name: "Apple SD Gothic Neo", size: 35) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.Center
        switch pickerViewData[row]{
        case "Experiment 1":
            experiment = 1
        case "Experiment 2":
            experiment = 2
        case "Experiment 3":
            experiment = 3
        case "Experiment 4":
            experiment = 4
        case "Experiment 5":
            experiment = 5
        default:
            experiment = 0
        }
        return pickerLabel
        
    }
    
    func pickerViewNumber(pickerViewNumber: UIPickerView, viewForRow row: Int, forComponent component2: Int, reusingView view: UIView?) -> UIView
    {
        let pickerLabel2 = UILabel()
        pickerLabel2.textColor = UIColor.whiteColor()
        pickerLabel2.text = String(pickerViewNumberData[row])
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        pickerLabel2.font = UIFont(name: "Apple SD Gothic Neo", size: 35) // In this use your custom font
        pickerLabel2.textAlignment = NSTextAlignment.Center

        return pickerLabel2
        
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