//
//  ViewModel.swift
//  Phising
//
//  Created by Simeon Irudhaya Raj J on 20/02/20.
//  Copyright © 2020 Simeon Irudhaya Raj J. All rights reserved.
import UIKit

protocol ViewModel {
    var view: MainView! { set  get }
    var apiHandler: ApiHandler! { set get }
    func verifyButtonPressed(URL: String)
    func viewDidLoad()
    func keyBoardShown(notification: Notification)
    func keyboardHidden()
    func viewTapped()
    func feedBackButtonPressed(url: String)
    func feedbackAlertAction(url: String, highChance: Bool)
}
