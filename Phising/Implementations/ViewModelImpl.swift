//
//  ViewModelImpl.swift
//  Phising
//
//  Created by Simeon Irudhaya Raj J on 20/02/20.
//  Copyright © 2020 Simeon Irudhaya Raj J. All rights reserved.
//
import UIKit

class ViewModelImpl: ViewModel {
    // MARK: - Dependencies
    var apiHandler: ApiHandler!
    var view: MainView!
    
    init(apiHandler: ApiHandler) {
        self.apiHandler = apiHandler
    }
    
    //MARK: - Exposed funcions
    func verifyButtonPressed(URL: String) {
        if !self.isValidUrl(url: URL) {
            self.view.showInvalidUrlAlert()
        }
        self.view.setProgressBarVisiblity(as: true)
        self.view.setProgress(precentage: 50)
        self.apiHandler.makeVerifyReq(URL: URL) { response in
            if let urlStatus = UrlStatus(rawValue: response) {
                self.view.setProgress(precentage: 75)
                switch urlStatus {
                case .error:
                    self.view?.showErrorResult()
                    self.view.setProgressBarVisiblity(as: false)
                    
                case .safe:
                    self.view?.showSafeResult()
                    self.view.setProgressBarVisiblity(as: false)
                    
                case .unSafe:
                    self.view?.showUnSafeResult()
                    self.view.setProgressBarVisiblity(as: false)
                }
            }
        }
    }
    
    func viewDidLoad() {
        self.view.addTapListener()
        self.view.addKeyboardListener()
        self.view.setProgressBarVisiblity(as: false)
        view.setupProgressBar()
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
    
    func feedBackButtonPressed(url: String) {
        if !self.isValidUrl(url: url) {
            view.showInvalidUrlAlert()
            return
        }
        view.showFeedBackAlert()
    }
    
    func feedbackAlertAction(url: String, highChance: Bool) {
        var chance = 0
        if highChance {
            chance = -1
        } else {
            chance = 1
        }
        self.apiHandler.sendFeedBack(url: url, chance:chance) {
            sucess in
            if sucess {
                self.view.showThankyouAlert()
            } else {
                self.view.showErrorResult()
            }
        }
    }
}

// MARK: - utils

extension ViewModelImpl {
    func isValidUrl(url: String) -> Bool {
        return url.isValidURL()
    }
}
