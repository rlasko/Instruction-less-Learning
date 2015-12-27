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
    
    var pickerViewData: [String] = [String]()
    
    var experiment:Int = 0
    
    @IBOutlet weak var subjectID: UITextField!
    
    @IBAction func input(sender : UIButton) {
        subject = String(subjectID.text)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Connect Picker
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        //Create Picker Array
        pickerViewData = ["Experiment 1", "Experiment 2", "Experiment 3", "Experiment 4", "Experiment 5"]
        
    }
    

    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

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
        return pickerViewData[row]
    }
    
    
    //Send data to SecondViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondVC: SecondViewController = segue.destinationViewController as! SecondViewController

        secondVC.experimentRecieved = experiment
        secondVC.subjectString = subject
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
        //Navigation bar appearence
        navigationController!.navigationBar.barTintColor = UIColor.blackColor()
    }

}