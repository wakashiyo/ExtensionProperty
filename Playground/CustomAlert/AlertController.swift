//
//  AlertController.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/15.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit

class AlertController: UIViewController, UIViewControllerTransitioningDelegate {
    
    lazy var baseView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var AlertView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        view.frame.size = CGSize(width: 200, height: 150)
        view.center = self.view.center
        return view
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        //init時に宣言しないと、前の画面を透過しない
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = UIModalPresentationStyle.custom
        self.transitioningDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
    }
    
    func layoutView() {
        view.addSubview(baseView)
        baseView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        baseView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        baseView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        baseView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        view.addSubview(AlertView)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AlertAnimation(true)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AlertAnimation(false)
    }

}
