//
//  SetTimerViewController.swift
//  RoundTimer
//
//  Created by Jerry haaser on 7/22/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class SetTimerViewController: UIViewController {

    @IBOutlet weak var setRoundTimePicker: UIPickerView!
    @IBOutlet weak var setRestTimerPicker: UIPickerView!
    
    
    var delegate: DatePickerDelegate?
    
    var dateFormatter = DateFormatter()
    
    var minutes:Int = 0
    var seconds:Int = 0
    //var roundDateFormatter = dateFormatter.dateFormat =  "HH:mm"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setRoundPicker.delegate = self
        setViews()
    }
    
    func setViews() {
        setRoundTimePicker.delegate = self
        setRestTimerPicker.delegate = self
        dateFormatter.dateFormat =  "mm:ss"
        //setRoundPicker.datePickerStyle(dateFormatter)
        
    }
    
    
    @IBAction func setButtonPressed(_ sender: UIButton) {
//        let date = setRoundTimePicker.date
//        delegate?.destinationDateWasChosen(date: date)
        dismiss(animated: true, completion: nil)
        _ = navigationController?.popToRootViewController(animated: true)
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

extension SetTimerViewController:UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 60
        case 1:
            return 60

        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/2
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) Minute"
        case 1:
            return "\(row) Second"
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            minutes = row
        case 1:
            seconds = row
        default:
            break;
        }
    }
}
