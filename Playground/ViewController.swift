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
    
    lazy var v: UIView = {
        let v = UIView()
        v.frame.size = CGSize(width: 400, height: 200)
        //v.center = self.view.center
        v.backgroundColor = UIColor.lightGray
        v.alpha = 0
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.frame.size = CGSize(width: 200, height: 50)
        label.backgroundColor = UIColor.blue
        label.frame.origin = CGPoint(x: 50, y: 50)
        view.addSubview(label)
        view.addSubview(button)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        button.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        button.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        button.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //self.button.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        
 
        view.addSubview(v)
    }

    @objc
    func tapped() {
        //let alert = AlertController()
        //self.present(alert, animated: true, completion: nil)
        
        let actionsheet = ActionSheetController()
        self.present(actionsheet, animated: true, completion: nil)
        
//        UIView.animate(withDuration: 0.3, animations: {
//            self.button.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//            self.v.alpha = 0.5
//            //self.button.frame.size = CGSize(width: 0, height: 0)
//        }, completion: { bool in
//            UIView.animate(withDuration: 0.3, animations: {
//                self.button.transform = CGAffineTransform.identity
//            })
//        })
        //self.button.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
    }
    
}

