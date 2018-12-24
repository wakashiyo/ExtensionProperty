//
//  B_ViewController.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/24.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit

class B_ViewController: UIViewController {
    
    lazy var b_view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(b_view)
        
        b_view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        b_view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        b_view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        b_view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }
}
