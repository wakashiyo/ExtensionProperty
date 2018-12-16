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
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var AlertView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        //init時に宣言しないと、前の画面を透過しない
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = UIModalPresentationStyle.custom  //overFullScreen, overCurrentContextでも透過したけど、、、違いわからん。。。
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
        view.addSubview(AlertView)
        
        baseView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        baseView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        baseView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        baseView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        AlertView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        AlertView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        AlertView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        AlertView.heightAnchor.constraint(greaterThanOrEqualTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AlertAnimation(true)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AlertAnimation(false)
    }

}
