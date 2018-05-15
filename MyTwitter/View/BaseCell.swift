//
//  BaseCell.swift
//  MyTwitter
//
//  Created by Leela Prasad on 09/05/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    
    let seperatorLineView: UIView = {
       
        let lineView = UIView()
        lineView.backgroundColor = UIColor.init(white: 0.8, alpha: 0.25)
        lineView.isHidden = true
        return lineView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(seperatorLineView)
        backgroundColor = .white
        addConstraintsWithFormat("H:|[v0]|", views: seperatorLineView)
        addConstraintsWithFormat("V:[v0(1.5)]|", views: seperatorLineView)
    }
    
    
}
