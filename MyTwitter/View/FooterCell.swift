
//
//  FooterCell.swift
//  MyTwitter
//
//  Created by Leela Prasad on 09/05/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

class FooterCell: BaseCell {
    
    
    var tapCallback: (() -> ())? {
        didSet{
            print("It is set")
        }
    }

    lazy var nameLabel: UILabel = {
        
        let lbl = UILabel.init()
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.text = "Show me More"
        //lbl.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(onMore)))
        return lbl
        
    }()
    
    @objc func onMore() {
        tapCallback?()
    }
    
    func setCallback(_ call: (()->())?) {
        self.tapCallback = call
    }
    
    override func setupViews() {
        addSubview(nameLabel)
        nameLabel.textColor = .black
        let whiteBackgroundView = UIView.init()
        whiteBackgroundView.backgroundColor = .white
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(onMore))
        addGestureRecognizer(tap)
        
        addSubview(whiteBackgroundView)
        bringSubview(toFront: nameLabel)
        
        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        whiteBackgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
}
