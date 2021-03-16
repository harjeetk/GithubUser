//
//  BaseViewController.swift
//  Dentist
//
//  Created by C100-105 on 16/07/19.
//  Copyright © 2019 C100-105. All rights reserved.
//

import UIKit

protocol BaseViewControllerProtocol {
    func setupUI()
    func bindUI()
}

typealias BaseViewController = BaseVC & BaseViewControllerProtocol

class BaseVC: UIViewController {
    
    var activityIndicator = CustomActivityIndicator(frame: .zero)
    
    //MARK: - VC life cycle callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.default
        
    }
    
    func bindUI(viewModel: BaseViewModel) {
        viewModel.isLoaderHidden.bind({ [weak self] in
            if $0 {
                self?.hideIndicator()
            } else {
                self?.showIndicator()
            }
        })
        
        viewModel.alertMessage.bind({ [weak self] in
            self?.showToast(message: $0.body)
        })
        
    }
    
    func showIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.show(onView: self.view)
        }
    }
    
    func hideIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.hide()
        }
    }
}
