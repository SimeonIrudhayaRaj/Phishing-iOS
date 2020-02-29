//
//  ViewModelImpl.swift
//  Phising
//
//  Created by Simeon Irudhaya Raj J on 20/02/20.
//  Copyright © 2020 Simeon Irudhaya Raj J. All rights reserved.
//
import UIKit
class ViewModelImpl: ViewModel {
    var apiHandler: ApiHandler!
    
    var view: MainView!
    init(apiHandler: ApiHandler) {
        self.apiHandler = apiHandler
    }
    func verifyButtonPressed(URL: String) {
        let result = apiHandler.makeReq(URL: URL)
        view?.showResult(message: result)
    }

    func viewDidLoad() {
        self.view.addTapListener()
        self.view.addKeyboardListener()
    }

    func keyBoardShown(notification: Notification)
    {
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(cgRect: keyboardScreenEndFrame)
        let contentInset = UIEdgeInsets(top: 0,
                                        left: 0,
                                        bottom: keyboardViewEndFrame.height,
                                        right: 0)
        self.view.scrollScrollView(for: contentInset)
    }

    func keyboardHidden() {
        let contentInset = UIEdgeInsets.zero
        self.view.scrollScrollView(for: contentInset)
    }

    func viewTapped() {
        self.view?.hideKeyboard()
    }
}
