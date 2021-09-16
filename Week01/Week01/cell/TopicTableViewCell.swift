//
//  TopicTableViewCell.swift
//  Week01
//
//  Created by MD Abir Hasan Zoha on 9/15/21.
//

import UIKit

class TopicTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
