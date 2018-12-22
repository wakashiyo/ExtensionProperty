//
//  ViewController.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/15.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alertButton: UIButton!
    
    @IBOutlet weak var sideMenuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        sideMenuButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
    }

    @objc
    func tapped() {
        let alert = AlertController()
        self.present(alert, animated: true, completion: nil)
        
        //let actionsheet = ActionSheetController()
        //self.present(actionsheet, animated: true, completion: nil)
    }
    
    @objc
    func nextVC() {
        let nav = UINavigationController(rootViewController: MainViewController())
        let side = SideMenuController()
        let manager = ManagerViewController<MainViewController>(nav, side)
        present(manager, animated: true, completion: nil)
    }
    
}

