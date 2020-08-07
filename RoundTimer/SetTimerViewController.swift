//
//  SetTimerViewController.swift
//  RoundTimer
//
//  Created by Jerry haaser on 7/22/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit

//protocol UIPickerViewDelegate {
//    func roundAndRestTimeSet(date: String)
//}

class SetTimerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var setRoundTimePicker: UIPickerView!
    @IBOutlet weak var setRestTimerPicker: UIPickerView!
    
    var tVC: TimerViewController?
    var timeModel: TimeModel?
    
//    var roundMinutes: Int?
//    var roundSeconds: Int?
//    var restMinutes: Int?
//    var restSeconds: Int?
    
    
    var delegate: UIPickerViewDelegate?
    
    var dateFormatter = DateFormatter()
    
    var minutes:Int = 0
    var seconds:Int = 0
    var numOfRounds:Int = 0
    //var roundDateFormatter = dateFormatter.dateFormat =  "HH:mm"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setRoundTimePicker.delegate = self
        setRoundTimePicker.dataSource = self
        setRestTimerPicker.delegate = self
        setRestTimerPicker.dataSource = self
        setViews()
    }
    
    func setViews() {
//        setRoundTimePicker.delegate = self
//        setRestTimerPicker.delegate = self
        dateFormatter.dateFormat =  "mm:ss"
        //setRoundPicker.datePickerStyle(dateFormatter)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == setRoundTimePicker {
            return 2
        } else if pickerView == setRestTimerPicker {
            return 2
        } else {
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == setRoundTimePicker {
            switch component {
            case 0:
                return 60
            case 1:
                return 60

            default:
                return 0
            }
        } else if pickerView == setRestTimerPicker {
            switch component {
            case 0:
                return 60
            case 1:
                return 60

            default:
                return 0
            }
        } else {
            return 99
        }
//        switch component {
//        case 0:
//            return 60
//        case 1:
//            return 60
//
//        default:
//            return 0
//        }
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/2
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == setRoundTimePicker {
            switch component {
            case 0:
                return "\(row) Minute"
            case 1:
                return "\(row) Second"
            default:
                return ""
            }
        } else if pickerView == setRestTimerPicker {
            switch component {
            case 0:
                return "\(row) Minute"
            case 1:
                return "\(row) Second"
            default:
                return ""
            }
        } else {
            return "\(row) Rounds"
        }
//        switch component {
//        case 0:
//            return "\(row) Minute"
//        case 1:
//            return "\(row) Second"
//        default:
//            return ""
//        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == setRoundTimePicker {
            switch component {
            case 0:
                minutes = row
            case 1:
                seconds = row
            default:
                break;
            }
        } else if pickerView == setRestTimerPicker {
            switch component {
            case 0:
                minutes = row
            case 1:
                seconds = row
            default:
                break;
            }
        } else {
            numOfRounds = row
        }
//        switch component {
//        case 0:
//            minutes = row
//        case 1:
//            seconds = row
//        default:
//            break;
//        }
    }


    func setSeperateTimeVariables() {
        guard tVC != nil else {return}
        guard let timeModel = timeModel else {return}
        
        //        var roundminutes = setRoundTimePicker.selectedRow(inComponent: 0)
        //        var roundseconds = setRoundTimePicker.selectedRow(inComponent: 1)
        //        var rMinutes = setRestTimerPicker.selectedRow(inComponent: 0)
        //        var rSeconds = setRestTimerPicker.selectedRow(inComponent: 1)
        
        let roundminutes = setRoundTimePicker.selectedRow(inComponent: 0)
        print(roundminutes)
        let roundseconds = setRoundTimePicker.selectedRow(inComponent: 1)
        let rMinutes = setRestTimerPicker.selectedRow(inComponent: 0)
        let rSeconds = setRestTimerPicker.selectedRow(inComponent: 1)
        
        timeModel.roundMinute = roundminutes
        timeModel.roundSecond = roundseconds
        timeModel.restMinute = rMinutes
        timeModel.restSecond = rSeconds
        //
        //        roundMinutes = roundminutes
        //        roundSeconds = roundseconds
        //        restMinutes = rMinutes
        //        restSeconds = rSeconds
    }
    
    
    @IBAction func setButtonPressed(_ sender: UIButton) {
        //        let date = setRoundTimePicker.date
        //        delegate?.destinationDateWasChosen(date: date)
        //dismiss(animated: true, completion: nil)
        setSeperateTimeVariables()
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

//extension SetTimerViewController:UIPickerViewDelegate,UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 2
//    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        switch component {
//        case 0:
//            return 60
//        case 1:
//            return 60
//
//        default:
//            return 0
//        }
//    }
//
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        return pickerView.frame.size.width/2
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        switch component {
//        case 0:
//            return "\(row) Minute"
//        case 1:
//            return "\(row) Second"
//        default:
//            return ""
//        }
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        switch component {
//        case 0:
//            minutes = row
//        case 1:
//            seconds = row
//        default:
//            break;
//        }
//    }
//}
