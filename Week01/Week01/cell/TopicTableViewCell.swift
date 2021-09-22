//
//  TopicTableViewCell.swift
//  Week01
//
//  Created by MD Abir Hasan Zoha on 9/15/21.
//

import UIKit

class TopicTableViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var progressView: UIProgressView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(title: String, timeInSecond: Int, progress: Float) {
        titleLabel.text = title
        
        let minuteInput = timeInSecond / 60
        let hour = minuteInput / 60
        let minute = minuteInput % 60
        
        timeLabel.text = String(format: "%dh:%dm", hour, minute)
        
        progressView.progress = progress
        
        if progress < 0.5 {
            progressView.tintColor = .systemRed
        } else if progress < 1.0 {
            progressView.tintColor = .systemYellow
        } else {
            progressView.tintColor = .systemGreen
        }
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: .main)
    }
}
