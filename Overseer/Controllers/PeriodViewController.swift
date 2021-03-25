//
//  PeriodViewController.swift
//  Overseer
//
//  Created by Joshua Fan on 8/7/20.
//  Copyright © 2020 joshuafan. All rights reserved.
//

import UIKit
import os.log

class PeriodViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var deadlinePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var task:Task?
    
    //MARK: - Navigation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        
        //use old style date pickers
        timePicker.preferredDatePickerStyle = .wheels
        deadlinePicker.preferredDatePickerStyle = .wheels
        //only include duration
        timePicker.datePickerMode = .countDownTimer
        
        updateSaveButtonState()
    }
    
    // sends data to PeriodTableViewController when save button is clicked
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        task = Task(name: nameField.text!, timeRequired: timePicker.countDownDuration, deadline: deadlinePicker.date)
        
        var scheduler = Scheduler()
        
        scheduler.add(name: nameField.text!, lengthRequired: timePicker.countDownDuration)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - UITextFieldDelegate
    
    // disable save button when editing text field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    // if user ends editing and the text field is not nil, enable button
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    // clicking enter ends editing
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.endEditing(true)
        return true
    }
    
    //MARK: - Private Methods
    
    private func updateSaveButtonState() {
        let text = nameField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
}

