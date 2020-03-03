//
//  APIHandler.swift
//  Phising
//
//  Created by Simeon Irudhaya Raj J on 20/02/20.
//  Copyright © 2020 Simeon Irudhaya Raj J. All rights reserved.
//
import Alamofire

class APIHandlerAlamofireImpl: ApiHandler {
    func sendFeedBack(url: String, highChance: Bool) {
        Alamofire.request("https://www.google.com",
                          method: .post,
                          parameters: ["url": url,"chance": highChance],
                          encoding: URLEncoding.default,
                          headers: nil).response {response in
                            print(response.data)
        }
    }
    
    func makeVerifyReq(URL url: String) -> String {
        Alamofire.request("https://www.google.com",
                          method: .get,
                          parameters: ["url": url],
                          encoding: URLEncoding.default,
                          headers: nil).response {response in
                            print(response.data)
        }
        return "ok"
    }
}
