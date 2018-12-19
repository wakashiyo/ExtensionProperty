//
//  SideMenuController.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/16.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit

//サイドメニューのViewController
class SideMenuController: UIViewController {
    
    //ここでのサイドメニューはシンプルにUITableViewで実装
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(tableView)
        //tableViewのレイアウトはViewControllerのviewのAnchorに合わせる
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }

}
