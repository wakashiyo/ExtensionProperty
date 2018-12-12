//
//  ViewController.swift
//  ExtensionProperty
//
//  Created by 吉川昂広 on 2018/12/12.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        let a = tableView.ep.base1
        return a
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

