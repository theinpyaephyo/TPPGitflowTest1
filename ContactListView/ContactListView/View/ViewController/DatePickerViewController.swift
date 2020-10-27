//
//  DatePickerViewController.swift
//  ContactListView
//
//  Created by THEIN PYAE PHYO on 2020/10/18.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet weak var tfDOB: UITextField!
    
    let datePicker = UIDatePicker()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tfDOB.addTarget(self, action: #selector(onTapDOB), for: .allTouchEvents)
        
    }
    
    @objc func onTapDOB() {
        
//        datePicker.sizeToFit()
        datePicker.datePickerMode = .date
        
        tfDOB.inputView = datePicker
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let btnDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(onTapDone))
        toolBar.setItems([btnDone], animated: true)
        
        tfDOB.inputAccessoryView = toolBar
        
        
        
    }
    
    @objc func onTapDone() {
        
        self.view.endEditing(true)
        
        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
        
        
        tfDOB.text = dateFormatter.string(from: datePicker.date)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
