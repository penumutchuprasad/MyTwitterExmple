//
//  HeaderCell.swift
//  MyTwitter
//
//  Created by Leela Prasad on 09/05/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

class HeaderCell: BaseCell {
    
    lazy var nameLabel: UILabel = {
        
        let lbl = UILabel.init()
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.text = "WHO TO FOLLOW ???"
        return lbl
        
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(nameLabel)
        seperatorLineView.isHidden = false
//        seperatorLineView.backgroundColor = .blue

        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
}
