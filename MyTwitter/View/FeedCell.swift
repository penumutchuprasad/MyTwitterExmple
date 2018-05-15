//
//  FeedCell.swift
//  MyTwitter
//
//  Created by Leela Prasad on 09/05/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

class FeedCell: BaseCell {
    
    
    var user: User? {
        didSet{
            
            if let usr = user {
                self.nameLabel.text = usr.name
                self.userNameLabel.text = usr.userName
                self.bioTextView.text = usr.bioText
                //self.profileImgView.image = usr.profImage
            }
            
        }
    }
    
    
    
    lazy var profileImgView: UIImageView = {
       
        let imgView = UIImageView.init()
        imgView.contentMode = .scaleAspectFill
        imgView.image = #imageLiteral(resourceName: "profpic")
        imgView.layer.cornerRadius = 5
        imgView.clipsToBounds = true
        return imgView
        
    }()

    lazy var nameLabel: UILabel = {
    
        let lbl = UILabel.init()
//        lbl.backgroundColor = .green

        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.text = "Leela Krishna"
        return lbl
        
    }()
    
    lazy var userNameLabel: UILabel = {
        
        let lbl = UILabel.init()
//        lbl.backgroundColor = .purple

        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        lbl.text = "@LeelaKrishn4"
        return lbl
        
    }()
    
    lazy var bioTextView: UITextView = {
       
        let tv = UITextView.init()
//        tv.backgroundColor = .yellow
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.isEditable = false
        tv.text = "Going to publish more swift tutorials!... Because I know What I do not know...So You can know What I do not know!"
        return tv
    }()
    
    lazy var followButton: UIButton = {
        
        let btn = UIButton.systemButton(title: "Follow", image: nil, titleColor: .cyan, font: UIFont.boldSystemFont(ofSize: 14
        ), target: self, selector: #selector(onFollow_touchupInside))
        btn.layer.borderWidth = 0.75
        btn.layer.borderColor = UIColor.cyan.cgColor
        btn.layer.cornerRadius = 5.0
        btn.clipsToBounds = true
//        btn.setImage(#imageLiteral(resourceName: "globe"), for: .normal)
        btn.setTitle("Follow", for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
//        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)
        return btn
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        addSubview(profileImgView)
        addSubview(nameLabel)
        addSubview(userNameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
                
        profileImgView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
        nameLabel.anchor(self.topAnchor, left: profileImgView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 12, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 20)
        userNameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        bioTextView.anchor(userNameLabel.bottomAnchor, left: userNameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 4, leftConstant: 0, bottomConstant: 5, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        followButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 40)
        
        
        
    }
    
    //Follow button Action...
    
    @objc func onFollow_touchupInside() {
        
        print("User Pressed Follow")
    }
    
    
}
