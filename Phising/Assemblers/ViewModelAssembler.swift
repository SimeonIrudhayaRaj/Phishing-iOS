//
//  ViewModelAssembler.swift
//  Phising
//
//  Created by Simeon Irudhaya Raj J on 20/02/20.
//  Copyright © 2020 Simeon Irudhaya Raj J. All rights reserved.
//

class ViewModelAssembler {
    static func createInstance() -> ViewModel {
        return ViewModelImpl(apiHandler: APIHandlerAssembler.createInstance())
    }
}
