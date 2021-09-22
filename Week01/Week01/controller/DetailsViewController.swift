//
//  DetailsViewController.swift
//  Week01
//
//  Created by MD Abir Hasan Zoha on 9/15/21.
//

import UIKit

class DetailsViewController: UIViewController{
    @IBOutlet weak var progressSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        print("slider value: \(sender.value)")
        
        let progress = sender.value
        
        UIView.animate(withDuration: 0.3) {
            if progress < 0.5 {
                sender.tintColor = .systemRed
            } else if progress < 1.0 {
                sender.tintColor = .systemYellow
            } else {
                sender.tintColor = .systemGreen
            }
        }
    }
}
