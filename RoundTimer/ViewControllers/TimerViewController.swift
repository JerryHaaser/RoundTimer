//
//  TimerViewController.swift
//  RoundTimer
//
//  Created by Jerry haaser on 7/22/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDelegate {
    

    @IBOutlet weak var setTimerButton: UIBarButtonItem!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var roundMinuteLabel: UILabel!
    @IBOutlet weak var roundSecondLabel: UILabel!
    @IBOutlet weak var restMinuteLabel: UILabel!
    @IBOutlet weak var restSecondLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
 
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        setTimerClocks()

        // Do any additional setup after loading the view.
    }
    
    //MARK: not sure which one I should use
    
    override func viewDidAppear(_ animated: Bool) {
        setTimerClocks()
    }
    
    var timer: Timer?
    
    var sTVC: SetTimerViewController?
    var timeModel: TimeModel?
    
//    var roundMinutes: Int?
//    var roundSeconds: Int?
//    var restMinutes: Int?
//    var restSeconds: Int?
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm ss"
        return formatter
    }
    
    func setTimerClocks() {
        guard let sTVC = sTVC else {return}
        guard let timeModel = timeModel else {return}
        
//        if sTVC.roundMinutes == nil {
//            roundMinuteLabel.text = "00"
//        } else {
//            roundMinuteLabel.text = "\(String(describing: sTVC.roundMinutes))"
//        }
//
//        if sTVC.roundSeconds == nil {
//            roundSecondLabel.text = "00"
//        } else {
//            roundSecondLabel.text = "\(String(describing: sTVC.roundSeconds))"
//        }
//
//        if sTVC.restMinutes == nil {
//            restMinuteLabel.text = "00"
//        } else {
//            restMinuteLabel.text = "\(String(describing: sTVC.restSeconds))"
//        }
//
//        if sTVC.restSeconds == nil {
//            restSecondLabel.text = "00"
//        } else {
//            restSecondLabel.text = "\(String(describing: sTVC.restSeconds))"
//        }
        
        if timeModel.roundMinute == nil {
            roundMinuteLabel.text = "00"
        } else {
            roundMinuteLabel.text = "\(String(describing: timeModel.roundMinute))"
        }
        
        if timeModel.roundSecond == nil {
            roundSecondLabel.text = "00"
        } else {
            roundSecondLabel.text = "\(String(describing: timeModel.roundSecond))"
        }
        
        if timeModel.restMinute == nil {
            restMinuteLabel.text = "00"
        } else {
            restMinuteLabel.text = "\(String(describing: timeModel.restMinute))"
        }
        
        if timeModel.restSecond == nil {
            restSecondLabel.text = "00"
        } else {
            restSecondLabel.text = "\(String(describing: timeModel.restSecond))"
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: roundRepeater(timer:))
    }
    
    func roundRepeater(timer: Timer) {
        
    }
    
    
    
    @IBAction func setTimerButtonPushed(_ sender: Any) {
        
    }
    
    @IBAction func playPauseButtonPushed(_ sender: UIButton) {
        startTimer()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SetRoundTimeSegue" {
            if let setTimerVC = segue.destination as? SetTimerViewController {
                setTimerVC.delegate = self
            }
        }
    }
    

}

//extension TimerViewController: UIPickerViewDelegate {
//
//    func roundAndRestTimeSet(roundMin: Int, roundSec: Int, restMin: Int, restSec: Int) {
//        //timeLabel.text = dateFormatter.string(from: date)
//        roundMinuteLabel.text = "\(roundMin)"
//        roundSecondLabel.text = "\(roundSec)"
//        restMinuteLabel.text = "\(restMin)"
//        restSecondLabel.text = "\(restSec)"
//    }
//
//
//}
