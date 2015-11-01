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
    
    var PickerViewData: [String] = [String]()
    
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
        PickerViewData = ["Experiment 1", "Experiment 2", "Experiment 3", "Experiment 4", "Experiment 5"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PickerViewData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PickerViewData[row]
    }

}