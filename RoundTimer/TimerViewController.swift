//
//  TimerViewController.swift
//  RoundTimer
//
//  Created by Jerry haaser on 7/22/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var setTimerButton: UIBarButtonItem!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setTimerButtonPushed(_ sender: Any) {
    }
    
    @IBAction func playPauseButtonPushed(_ sender: UIButton) {
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
