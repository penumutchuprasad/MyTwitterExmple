//
//  TweetCell.swift
//  MyTwitter
//
//  Created by Leela Prasad on 10/05/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

class TweetCell: BaseCell {
    
    
    var tweet: Tweet? {
        
        didSet{
            
            if let tweet = tweet {
                
                let attributedString = NSMutableAttributedString.init(string: tweet.user.name, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16)])
                let usrName = "  \(tweet.user.userName ?? "no user name") \n"
                
                attributedString.append(NSAttributedString.init(string: usrName, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16), NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)]))
                
                // Making some space between first line and the message text
                
                let paragraphStyle = NSMutableParagraphStyle.init()
                paragraphStyle.lineSpacing = 5
                let range = NSRange.init(location: 0, length: attributedString.string.count)
                
                attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: range)
                
                attributedString.append(NSAttributedString.init(string: tweet.message, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16)]))
                
                self.textView.attributedText = attributedString
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
    

    var textView: UITextView = {
        
        let tv = UITextView()
//        tv.backgroundColor = .yellow
        tv.isEditable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    var replyButton: UIButton = {
        let btn = UIButton.init(type: .system)
        btn.setImage(#imageLiteral(resourceName: "captial"), for: .normal)
        return btn
    }()
    
    var reTweetButton: UIButton = {
        let btn = UIButton.init(type: .system)
        btn.setImage(#imageLiteral(resourceName: "backspace"), for: .normal)
        return btn
    }()
    
    var likeButton: UIButton = {
        let btn = UIButton.init(type: .system)
        btn.setImage(#imageLiteral(resourceName: "globe"), for: .normal)
        return btn
    }()
    
    var dirMsgButton: UIButton = {
        let btn = UIButton.init(type: .system)
        btn.setImage(#imageLiteral(resourceName: "captial2"), for: .normal)
        return btn
    }()
    
    override func setupViews() {
        super.setupViews()
    
        addSubview(profileImgView)
        addSubview(textView)
        
        
         profileImgView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
    
        textView.anchor(topAnchor, left: profileImgView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()
        let view4 = UIView()
        
        let stcView = UIStackView.init(arrangedSubviews: [view1,view2,view3,view4])
        stcView.distribution = .fillEqually
        stcView.axis = .horizontal
        addSubview(stcView)
        // Add all buttons
        addSubview(replyButton)
        addSubview(reTweetButton)
        addSubview(likeButton)
        addSubview(dirMsgButton)
        
        
        replyButton.anchor(view1.topAnchor, left: view1.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        reTweetButton.anchor(view2.topAnchor, left: view2.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        likeButton.anchor(view3.topAnchor, left: view3.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        dirMsgButton.anchor(view4.topAnchor, left: view4.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)

        // Stack View Layouts
        stcView.anchor(nil, left: textView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
    }
    
    
}
