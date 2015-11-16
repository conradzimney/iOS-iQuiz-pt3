//
//  QuizCell.swift
//  iQuiz
//
//  Created by Conrad Zimney on 11/1/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import UIKit

class QuizCell: UITableViewCell {
    
    var subject: String = "" {
        didSet {
            if (subject != oldValue) {
                subjectLabel.text = subject
            }
        }
    }
    
    var desc: String = "" {
        didSet {
            if (desc != oldValue) {
                descriptionLabel.text = desc
            }
        }
    }
    
    var subjectLabel: UILabel!
    var descriptionLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let subjectLabelRect = CGRectMake(50, 5, 70, 15)
        let subjectMarker = UILabel(frame: subjectLabelRect)
        subjectMarker.textAlignment = NSTextAlignment.Right
        subjectMarker.text = "Subject:"
        subjectMarker.font = UIFont.boldSystemFontOfSize(12)
        contentView.addSubview(subjectMarker)
        
        let descLabelRect = CGRectMake(50, 26, 70, 15)
        let descMarker = UILabel(frame: descLabelRect)
        descMarker.textAlignment = NSTextAlignment.Right
        descMarker.text = "Desc:"
        descMarker.font = UIFont.boldSystemFontOfSize(12)
        contentView.addSubview(descMarker)
        
        let subjectValueRect = CGRectMake(130, 5, 200, 15)
        subjectLabel = UILabel(frame: subjectValueRect)
        contentView.addSubview(subjectLabel)
        
        let descriptionValueRect = CGRectMake(130, 26, 200, 15)
        descriptionLabel = UILabel(frame: descriptionValueRect)
        contentView.addSubview(descriptionLabel)
        
        descriptionLabel.font = UIFont.boldSystemFontOfSize(12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}