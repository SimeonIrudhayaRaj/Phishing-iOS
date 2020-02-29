//
//  ViewController.swift
//  Phising
//
//  Created by Simeon Irudhaya Raj J on 20/02/20.
//  Copyright © 2020 Simeon Irudhaya Raj J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var urlTextField: UITextField!
    
    //MARK: - Dependencies
    private var viewModel: ViewModel!
    

}

//MARK: - ViewLifeCycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModelAssembler.createInstance()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

//MARK: - IBActions
extension ViewController {
    @IBAction func verifyButton(_ sender: Any) {
        viewModel.verifyButtonPressed(URL: urlTextField.text ?? "")
    }
}

//MARK: - View
extension ViewController: MainView {
    func showResult(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func scrollScrollView(for contentInset: UIEdgeInsets) {
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }

    func hideKeyboard() {
        self.view.endEditing(true)

    }

    func convert(cgRect: CGRect) -> CGRect {
        return self.view.convert(cgRect, to: self.view.window)
    }

    func addKeyboardListener() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.keyboardShown),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.keyboardHidden),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    func addTapListener() {
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                       action: #selector(ViewController.scrollViewTapped))
        singleTap.numberOfTapsRequired = 1
        singleTap.numberOfTouchesRequired = 1
        self.scrollView.addGestureRecognizer(singleTap)
    }
}

// MARK: - KeyBoard notifications
extension ViewController {
    @objc func keyboardShown(notification: Notification) {
        self.viewModel.keyBoardShown(notification: notification)
    }
    
    @objc func keyboardHidden(notification: Notification) {
        self.viewModel.keyboardHidden()
    }
}

// MARK: - utils
extension ViewController {
    @objc func scrollViewTapped() {
        self.viewModel.viewTapped()
    }
}
