//
//  ApiHandler.swift
//  Phising
//
//  Created by Simeon Irudhaya Raj J on 20/02/20.
//  Copyright © 2020 Simeon Irudhaya Raj J. All rights reserved.
//

protocol ApiHandler {
    func makeVerifyReq(URL: String, completion: @escaping ((Int) -> Void))
    func sendFeedBack(url: String, chance: Int, completion: @escaping ((Bool) -> Void))
}
