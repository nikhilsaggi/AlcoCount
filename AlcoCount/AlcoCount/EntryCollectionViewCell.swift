//
//  EntryCollectionViewCell.swift
//  AlcoCount
//
//  Created by David Schwardt on 5/5/18.
//  Copyright © 2018 David Schwardt. All rights reserved.
//

import UIKit

class EntryCollectionViewCell: UICollectionViewCell {
    var rangeLabel: UILabel!
    var blurbLabel: UILabel!
    var color: UIColor!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        rangeLabel = UILabel()
        rangeLabel.font = UIFont.systemFont(ofSize: 14)
        rangeLabel.textColor = .black
        rangeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        blurbLabel = UILabel()
        blurbLabel.font = UIFont.systemFont(ofSize: 12)
        blurbLabel.textColor = .black
        blurbLabel.translatesAutoresizingMaskIntoConstraints = false
        
        rangeLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        rangeLabel.numberOfLines = 4
        
        blurbLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        blurbLabel.numberOfLines = 4
        
        contentView.addSubview(rangeLabel)
        contentView.addSubview(blurbLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            rangeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            rangeLabel.widthAnchor.constraint(equalToConstant: 120),
            rangeLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            rangeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            rangeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            ])
        
        NSLayoutConstraint.activate([
            blurbLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            blurbLabel.leadingAnchor.constraint(equalTo: rangeLabel.trailingAnchor, constant: 8),
            blurbLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            blurbLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            blurbLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            ])
        
        super.updateConstraints()
    }
}
