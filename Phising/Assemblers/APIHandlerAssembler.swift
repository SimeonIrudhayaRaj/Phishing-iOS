//
//  APIHandlerAssembler.swift
//  Phising
//
//  Created by Simeon Irudhaya Raj J on 20/02/20.
//  Copyright © 2020 Simeon Irudhaya Raj J. All rights reserved.
//
class APIHandlerAssembler {
    static func createInstance() -> ApiHandler {
        return APIHandlerAlamofireImpl()
    }
}
