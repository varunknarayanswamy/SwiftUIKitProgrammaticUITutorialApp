//
//  customCell.swift
//  ProgrammaticUITutorial
//
//  Created by Varun Narayanswamy on 1/26/20.
//  Copyright © 2020 Varun Narayanswamy. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {
    
    var cellTitle = UILabel()
    var subHeader = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(cellTitle)
        addSubview(subHeader)
        cellTitleConfig()
        subHeaderConfig()
        setTitleConstraints()
        setSubConstraints()
    }
    
    func set(cellHold: cellHolder)
    {
        cellTitle.text = cellHold.title
        cellTitle.font = UIFont.boldSystemFont(ofSize: 20)
        subHeader.text = cellHold.subheader
    }
    
    func cellTitleConfig()
    {
        cellTitle.numberOfLines = 0
        cellTitle.adjustsFontSizeToFitWidth = true
    }
    
    func subHeaderConfig()
    {
        subHeader.numberOfLines = 0
        subHeader.adjustsFontSizeToFitWidth = true
    }
    
    func setTitleConstraints()
    {
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cellTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        cellTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setSubConstraints()
    {
        subHeader.translatesAutoresizingMaskIntoConstraints = false
        subHeader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        subHeader.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 10).isActive = true
        subHeader.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
