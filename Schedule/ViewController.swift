//
//  ViewController.swift
//  TimeTable
//
//  Created by Alexey on 20.02.2019.
//  Copyright © 2019 AO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    
    
    @IBAction func tap(_ sender: Any) {
        inputClassroom.resignFirstResponder()
        inputSubjectField.resignFirstResponder()
    }
    
    @IBOutlet weak var inputSubjectField: UITextField!
    @IBOutlet weak var inputClassroom: UITextField!
    
    @IBOutlet weak var timeText: UILabel!
    @IBOutlet weak var pickerDate: UIPickerView!
    var day = 0, h = 0, m = 0
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let hours = [7,8,9,10,11,12,13,14,15,16,17,18,19]
    let minutes = [00,10,20,30,40,50,60]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var row = pickerView.selectedRow(inComponent: 0)

        if component == 0 {
            return days.count
        }
            
        if component == 1 {
            return hours.count
        }
        else {
            return minutes.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //var row = pickerView.selectedRowInComponent(0)
        if component == 0 {
            return days[row]
        }
        
        if component == 1 {
            return String(hours[row])
        }
        else {
            return String(minutes[row])
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let daySelected = days[pickerView.selectedRow(inComponent: 0)]
        let hoursSelected = hours[pickerView.selectedRow(inComponent: 1)]
        let minutesSelected = minutes[pickerView.selectedRow(inComponent: 2)]
        
        timeText.text =  "\(daySelected) at \(hoursSelected) : \(minutesSelected) "
        day = row
        h = hoursSelected
        m = minutesSelected
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    @objc func viewTapped(gestureRecognizer : UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @IBAction func doneButtonPress(_ sender: Any) {
        addSubject(name: inputSubjectField.text as! String, class1: inputClassroom.text as! String, day:day, h:h, m:m)
        print(Subjects)
        let newVC = storyboard?.instantiateViewController(withIdentifier: "NVC")
        present(newVC!, animated: true, completion: nil)
    }
    @IBAction func cancelButtonPress(_ sender: Any) {let newVC = storyboard?.instantiateViewController(withIdentifier: "NVC")
        present(newVC!, animated: true, completion: nil)
    }
    

}

