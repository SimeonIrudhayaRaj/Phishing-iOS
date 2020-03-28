//
//  View.swift
//  Phising
//
//  Created by Simeon Irudhaya Raj J on 20/02/20.
//  Copyright © 2020 Simeon Irudhaya Raj J. All rights reserved.
//
import UIKit

protocol MainView {
    func showSafeResult()
    func showUnSafeResult()
    func showErrorResult()
    func scrollScrollView(for contentInset: UIEdgeInsets)
    func hideKeyboard()
    func convert(cgRect: CGRect) -> CGRect
    func addKeyboardListener()
    func addTapListener()
    func showFeedBackAlert()
    func setProgress(precentage: Float)
    func setProgressBarVisiblity(as value: Bool)
    func showThankyouAlert()
    func setupProgressBar()
    func showInvalidUrlAlert()
}
