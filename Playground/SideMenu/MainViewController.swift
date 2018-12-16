//
//  MainViewController.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/16.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var delegate: SliderDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "≡", style: .plain, target: self, action: #selector(mainSlide))
        
        view.addSubview(mainView)
        
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc
    func mainSlide() {
        print("slide")
        delegate?.showSlide()
    }

}
