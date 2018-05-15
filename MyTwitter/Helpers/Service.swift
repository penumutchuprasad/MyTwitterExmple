//
//  Service.swift
//  MyTwitter
//
//  Created by Leela Prasad on 10/05/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import Foundation





struct Service {
    
    var ressss: AnyObject?

    static var shared = Service()
    
    mutating func fetchUsersFeed(completion: @escaping (AnyObject, Error?)->()) {
        
        let urlStr = "https://api.letsbuildthatapp.com/twitter/home"
        
        self.executeServices(urlString: urlStr, completion: completion)
        
        
    }
    
    
    mutating func executeServices(urlString: String, completion:@escaping ((AnyObject, Error?)->())) {
        
        let url = URL.init(string: urlString)
        guard let urlll = url else {return}
    
        URLSession.shared.dataTask(with: urlll) { (data, response, errr) in
            
            if errr != nil {
                completion("" as AnyObject, errr)
                return
            }
            
            do{
                if let result = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? AnyObject {
                    
//                    print(result as AnyObject)
                    completion(result as AnyObject, nil)
                    
                }
                
            }catch let errrrrr {
                
                completion(url as AnyObject, errrrrr)

                completion("" as AnyObject, errrrrr)
             
                print("errrrrr is in parsing function", errrrrr)
            }
            
        }.resume()
        
    }
    
}
