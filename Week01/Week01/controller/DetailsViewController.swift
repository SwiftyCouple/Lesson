//
//  DetailsViewController.swift
//  Week01
//
//  Created by MD Abir Hasan Zoha on 9/15/21.
//

import UIKit

class DetailsViewController: UIViewController{
    @IBOutlet private weak var progressSlider: UISlider!
    @IBOutlet private weak var titleImage: UIImageView!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var difficultyLabel: UILabel!
    @IBOutlet private weak var summaryLabel: UILabel!
    @IBOutlet private weak var keyPointsLabel: UILabel!
    
    var topic: Topic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "\(topic.title) Detail"
        
        titleImage.image = UIImage(named: topic.imageName) ?? UIImage(named: "default")
        
        summaryLabel.text = topic.summary
        
        let minuteInput = topic.timeInSec / 60
        let hour = minuteInput / 60
        let minute = minuteInput % 60
        
        timeLabel.text = String(format: "%dh:%dm", hour, minute)
        difficultyLabel.text = "\u{2022} \(topic.difficulty.rawValue)"
        progressSlider.value = topic.progress
        updateSliderColor()
        
        keyPointsLabel.attributedText = createKeyPoints(strings: topic.keyPoints)
    }
    
    func createKeyPoints(strings: [String]) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = 20
        paragraphStyle.minimumLineHeight = 15
        paragraphStyle.maximumLineHeight = 22
        paragraphStyle.paragraphSpacing = 10
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 20)]
        
        let stringAttributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        
        let string = strings.map({ "\u{2022}\t\($0)" }).joined(separator: "\n")
        
        return NSAttributedString(string: string, attributes: stringAttributes)
    }
    
    private func updateSliderColor() {
        let progress = progressSlider.value
        
        UIView.animate(withDuration: 0.3) {
            if progress < 0.5 {
                self.progressSlider.tintColor = .systemRed
            } else if progress < 1.0 {
                self.progressSlider.tintColor = .systemYellow
            } else {
                self.progressSlider.tintColor = .systemGreen
            }
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        print("slider value: \(sender.value)")
        
        updateSliderColor()
    }
    
    @IBAction func saveAction() {
        topic.setProgress(progress: progressSlider.value)
    }
}
