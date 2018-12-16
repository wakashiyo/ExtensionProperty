//
//  ViewController.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/15.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "action"
        button.frame.size = CGSize(width: 50, height: 30)
        button.center = self.view.center
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.frame.size = CGSize(width: 100, height: 80)
        button.frame.origin = CGPoint(x: 100, y: 100)
        button.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(button2)
    }

    @objc
    func tapped() {
        //let alert = AlertController()
        //self.present(alert, animated: true, completion: nil)
        
        let actionsheet = ActionSheetController()
        self.present(actionsheet, animated: true, completion: nil)
    }
    
    @objc
    func nextVC() {
        let nav = UINavigationController(rootViewController: MainViewController())
        let side = SideMenuController()
        let manager = ManagerViewController(nav, side)
        present(manager, animated: true, completion: nil)
    }
    
}

