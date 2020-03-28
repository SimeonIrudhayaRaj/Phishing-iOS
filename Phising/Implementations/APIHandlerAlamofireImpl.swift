//
//  APIHandlerAlamofireImpl.swift
//  Phising
//
//  Created by Simeon Irudhaya Raj J on 20/02/20.
//  Copyright © 2020 Simeon Irudhaya Raj J. All rights reserved.
//
//import Alamofire
import Foundation

class APIHandlerAlamofireImpl: ApiHandler {
    func sendFeedBack(url: String, chance: Int, completion: @escaping ((Bool) -> Void)) {
     var urlComponents = URLComponents(string: URLConstants.feebackUrl)!
            urlComponents.queryItems = [ URLQueryItem(name: "url", value: url),
                                         URLQueryItem(name: "feedback", value: String(chance))]
            guard let urlRequest = urlComponents.url else {
                return
            }
            var request = URLRequest(url: urlRequest)
            request.httpMethod = "GET"
            let session = URLSession.shared
        session.dataTask(with: request) {(data, response, error) in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }.resume()
    }

    func makeVerifyReq(URL url: String, completion: @escaping ((Int) -> Void)) {
        guard var urlComponents = URLComponents(string: URLConstants.checkUrl) else {
            completion(0)
            return
        }
        urlComponents.queryItems = [ URLQueryItem(name: "url", value: url) ]
        guard let urlRequest = urlComponents.url else {
            completion(0)
            return
        }
        var request = URLRequest(url: urlRequest)
        request.httpMethod = "GET"
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let response = response {
                    print(response)
                }
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(verificationResponseModel.self, from: data)
                        completion(response.status)
                        
                    } catch {
                        print(error)
                        completion(0)
                    }
                }
            }
        }.resume()
    }
}
