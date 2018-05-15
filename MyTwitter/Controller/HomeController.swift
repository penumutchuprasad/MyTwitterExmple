
//
//  HomeController.swift
//  MyTwitter
//
//  Created by Leela Prasad on 09/05/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let cellId = "FeedCell"
    let headerId = "HeaderCell"
    let footerId = "FooterCell"
    let tweetCellId = "TvartCell"
    
    var users = [User]()
    
    var tweets: [Tweet] = {
       
//        let leela = User(name: "Leela Krishna", userName: "@LeelaKrishn4", bioText: "Going to publish more swift tutorials!... Because I know What I do not know...So You can know What I do not know!", profImage: #imageLiteral(resourceName: "profpic"))
//        let abnboys = User(name: "ABN Boys", userName: "@abnboys", bioText: "ejkhf wejkdh hwqdgw kqwdjiwj uwdyuwdh wquydtuwdd wjedhjwnq djwndjn dekqwhjk qkjiwlnds whjgjwb", profImage: #imageLiteral(resourceName: "globe"))
//
//        let tweet1 = Tweet(user: leela, message: "hefihie wjhdjaw awdguwa wuydt  uwdg ajdhn  jadbjw  jwhdjwjwhdjw djwnghdjwbjh jhwdhjw jkadn akdh jwdjwb jdhjwh jdwhjwnd jwdhjw jwdhjwnd jhdjwndm hwjkdnm")
//        let tweet2 = Tweet(user: abnboys, message: "ejkfhdjs awjkx,msa kadnm kwd mjw woj ksjck ....")
//
//        return [tweet1, tweet2]
        return []
    }()
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        self.collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    
    lazy var errorShowingLabel: UILabel = {
       
        let lbl = UILabel.init()
        let str = "Some thing is wrong!.. Please try again later...Thank you for your patience!.."
        let atrrStr = NSMutableAttributedString.init(string: str)
        atrrStr.addAttribute(NSAttributedStringKey.underlineStyle, value: 1, range: NSRange.init(location: 0, length: atrrStr.length))
        lbl.attributedText = atrrStr
        lbl.textColor = .yellow
        lbl.isHidden = true
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.collectionView?.backgroundColor = #colorLiteral(red: 0.3422148408, green: 0.3601596487, blue: 0.400000006, alpha: 1)
        
        self.collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        self.collectionView?.register(TweetCell.self, forCellWithReuseIdentifier: tweetCellId)

        self.collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        self.collectionView?.register(FooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
        
        setupNavigationBarItems()
        
       
    }
    
    func showError(_ isNeeded: Bool) {
        
        view.addSubview(errorShowingLabel)
        view.addConstraintsWithFormat("H:|[v0]|", views: errorShowingLabel)
        view.addConstraintsWithFormat("V:|[v0]|", views: errorShowingLabel)
        errorShowingLabel.isHidden = !isNeeded

    }
    
    func presentNewVC() -> () {
        
        let newVC = NEXTVC()
//        self.present(newVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(newVC, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Service.shared.fetchUsersFeed { (result, err) in
            
            if let _ = err as NSError? {
                DispatchQueue.main.async {
                    self.showError(true)
                }
                return
            }else {
                DispatchQueue.main.async {
                    self.showError(false)
                }
            }
            
            guard let ressss = result as? [String: Any] else {return}
            guard let userArray = ressss["users"] as? [NSDictionary] else {return}
            guard let tweetsArray = ressss["tweets"] as? [[String:Any]] else {return}
            
            
            
            for arrrrr in userArray {
                guard let arr = arrrrr as? [String: Any] else {return}
                
                let user = User.init(name: arr["name"] as! String, userName: arr["username"] as! String, bioText: arr["bio"] as! String)
                self.users.append(user)
            }
            
            for twt in (tweetsArray as? [[String: Any]])! {
                
                guard let arr = twt["user"] as? [String: Any] else {return}
                
                let user = User.init(name: arr["name"] as! String, userName: arr["username"] as! String, bioText: arr["bio"] as! String)
                
                let tweet = Tweet(user: user, message: twt["message"] as! String)
                
                self.tweets.append(tweet)
                
            }
            
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
            
        }
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return users.count
        }else {
            
            return tweets.count
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? FeedCell {
                
                cell.user = users[indexPath.item]
                
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tweetCellId, for: indexPath) as? TweetCell {
                
                cell.tweet = tweets[indexPath.item]
                
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if indexPath.section == 0 {
            let user = users[indexPath.item]
            
            let txtViewWidth = self.view.frame.width - 92 - 8 // 5 is extra to get the right height from the monster method just below...
            let sizzz = CGSize(width: txtViewWidth, height: 500)
            let estdRect = NSString.init(string: user.bioText).boundingRect(with: sizzz, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16)], context: nil)
            
            return CGSize(width: self.view.frame.width, height: estdRect.height+61+20) // By totalling all constants of sub views
        }else{
            return CGSize(width: self.view.frame.width, height: 150)
        }
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.25
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    // For Headers And Footers...
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

            if kind == UICollectionElementKindSectionHeader {
                
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HeaderCell
                header.backgroundColor = .white
                return header
                
            }else {
                
                let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath) as! FooterCell
                footer.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
                
//                footer.tapCallback? = self.presentNewVC
                footer.setCallback(presentNewVC)
                return footer
            }
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section != 0 {
            return CGSize.zero
        }
        
        return CGSize(width: (self.collectionView?.frame.width)!, height: 50)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section != 0 {
            return CGSize.zero
        }
        
        return CGSize(width: (self.collectionView?.frame.width)!, height: 50)

    }
    
}


extension HomeController {
    
    private func setupNavigationBarItems() {
        
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        self.navigationItem.title = "Home"
        //        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9633895679, green: 1, blue: 0.8008836619, alpha: 1)
        
        let leftBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "globe").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleBarButtonItems(btn:)))
        leftBarButtonItem.tag = 1
        leftBarButtonItem.tintColor = navigationController?.navigationBar.tintColor
        leftBarButtonItem.imageInsets = UIEdgeInsets(top: 0, left: -45, bottom: 0, right: 0)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let searchButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "globe").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleBarButtonItems(btn:)))
        searchButton.tag = 54
        
        let composeButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "captial").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleBarButtonItems(btn:)))
        composeButton.tag = 23
        composeButton.tintColor = navigationController?.navigationBar.tintColor

        //searchButton.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -75)
        composeButton.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -20)
        
        self.navigationItem.rightBarButtonItems = [composeButton]
        
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        
        // To remove the bottom shadow for Navigation Bar...
        
        self.navigationController?.navigationBar.shadowImage = UIImage() // Giving an empty image first
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) // And also placing a nil image on bar...
        
        // If you like place an empty UIView, with height you like on view-controller's view...
        
        let navControllerBarSepView = UIView()
        navControllerBarSepView.backgroundColor = collectionView?.backgroundColor ?? .green
        view.addSubview(navControllerBarSepView)
        view.addConstraintsWithFormat("H:|[v0]|", views: navControllerBarSepView)
        view.addConstraintsWithFormat("V:|[v0(0.5)]", views: navControllerBarSepView)
        
    }
    
    @objc func handleBarButtonItems(btn: UIBarButtonItem) {
        
        print(btn.tag)
        
    }
}










