//
//  View.swift
//  Phising
//
//  Created by Simeon Irudhaya Raj J on 20/02/20.
//  Copyright © 2020 Simeon Irudhaya Raj J. All rights reserved.
//
import UIKit
protocol MainView {
    func showResult(message: String)
    func scrollScrollView(for contentInset: UIEdgeInsets)
    func hideKeyboard()
    func convert(cgRect: CGRect) -> CGRect
    func addKeyboardListener()
    func addTapListener()
}
