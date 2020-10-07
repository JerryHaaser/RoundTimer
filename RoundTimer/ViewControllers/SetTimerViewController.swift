//
//  SetTimerViewController.swift
//  RoundTimer
//
//  Created by Jerry haaser on 7/22/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit

protocol SetTimerVCDelegate {
    func toTimerVC()
}


class SetTimerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, Storyboarded {

    @IBOutlet weak var setRoundTimePicker: UIPickerView!
    @IBOutlet weak var setRestTimerPicker: UIPickerView!
    
    var coordinator: BaseCoordinator?
    
    var delegate: SetTimerVCDelegate?
    
    var tVC: TimerViewController?
    //var timeModel: TimeModel?
    
    var roundMinutes: Int? {
        didSet {
            tVC?.roundMinutes = roundMinutes
        }
    }
    
    var roundSeconds: Int?{
        didSet {
            tVC?.roundSeconds = roundSeconds
        }
    }
    var restMinutes: Int?{
        didSet {
            tVC?.restMinutes = restMinutes
        }
    }
    var restSeconds: Int?{
        didSet {
            tVC?.restSeconds = restSeconds
        }
    }
    
    
    var pickerDelegate: UIPickerViewDelegate?
    
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
        //guard let timeModel = timeModel else {return}

        //        var roundminutes = setRoundTimePicker.selectedRow(inComponent: 0)
        //        var roundseconds = setRoundTimePicker.selectedRow(inComponent: 1)
        //        var rMinutes = setRestTimerPicker.selectedRow(inComponent: 0)
        //        var rSeconds = setRestTimerPicker.selectedRow(inComponent: 1)

        let roundminutes = setRoundTimePicker.selectedRow(inComponent: 0)
        print(roundminutes)
        let roundseconds = setRoundTimePicker.selectedRow(inComponent: 1)
        let rMinutes = setRestTimerPicker.selectedRow(inComponent: 0)
        let rSeconds = setRestTimerPicker.selectedRow(inComponent: 1)

//        timeModel.roundMinute = roundminutes
//        timeModel.roundSecond = roundseconds
//        timeModel.restMinute = rMinutes
//        timeModel.restSecond = rSeconds
        //
        //        roundMinutes = roundminutes
        //        roundSeconds = roundseconds
        //        restMinutes = rMinutes
        //        restSeconds = rSeconds
    }
    
    func setClockLabel() {
        roundMinutes = setRoundTimePicker.selectedRow(inComponent: 0)
        roundSeconds = setRoundTimePicker.selectedRow(inComponent: 1)
        restMinutes = setRestTimerPicker.selectedRow(inComponent: 0)
        restSeconds = setRestTimerPicker.selectedRow(inComponent: 1)
    }
    
    
    @IBAction func setButtonPressed(_ sender: UIButton) {
        
        print(setRoundTimePicker.selectedRow(inComponent: 0))
        print(setRoundTimePicker.selectedRow(inComponent: 1))
        setClockLabel()
        
        //setSeperateTimeVariables()
//        guard let timeModel = timeModel else { return }
//        var roundMin = timeModel.roundMinute!
//        var roundSec = timeModel.roundSecond!
//        var restMin = timeModel.restMinute!
//        var restSec = timeModel.restSecond!
//        let tVC1 = TimerViewController()
        //delegate?.roundAndRestTimeSet(roundMin: roundMin, roundSec: roundSec, restMin: restMin, restSec: restSec)
        navigationController?.popToRootViewController(animated: true)
        //delegate?.toTimerVC()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
        //delegate?.toTimerVC()
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

//extension SetTimerViewController {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        if pickerView == setRoundTimePicker {
//    return 2
//} else if pickerView == setRestTimerPicker {
//    return 2
//} else {
//    return 1
//}
//    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//if pickerView == setRoundTimePicker {
//    switch component {
//    case 0:
//        return 60
//    case 1:
//        return 60
//
//    default:
//        return 0
//    }
//} else if pickerView == setRestTimerPicker {
//    switch component {
//    case 0:
//        return 60
//    case 1:
//        return 60
//
//    default:
//        return 0
//    }
//} else {
//    return 99
//}
//    }
//
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        return pickerView.frame.size.width/2
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//if pickerView == setRoundTimePicker {
//    switch component {
//    case 0:
//        return "\(row) Minute"
//    case 1:
//        return "\(row) Second"
//    default:
//        return ""
//    }
//} else if pickerView == setRestTimerPicker {
//    switch component {
//    case 0:
//        return "\(row) Minute"
//    case 1:
//        return "\(row) Second"
//    default:
//        return ""
//    }
//} else {
//    return "\(row) Rounds"
//}
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//if pickerView == setRoundTimePicker {
//    switch component {
//    case 0:
//        minutes = row
//    case 1:
//        seconds = row
//    default:
//        break;
//    }
//} else if pickerView == setRestTimerPicker {
//    switch component {
//    case 0:
//        minutes = row
//    case 1:
//        seconds = row
//    default:
//        break;
//    }
//} else {
//    numOfRounds = row
//}
//    }
//}
