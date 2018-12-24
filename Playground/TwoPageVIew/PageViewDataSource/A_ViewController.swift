//
//  A_ViewController.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/24.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit


class A_ViewController: UIViewController {
    
    lazy var a_view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(a_view)
        
        a_view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        a_view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        a_view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        a_view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }
}
