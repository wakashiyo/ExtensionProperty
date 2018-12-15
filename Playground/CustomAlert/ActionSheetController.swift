//
//  ActionSheetController.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/15.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit

class ActionSheetController: UIViewController, UIViewControllerTransitioningDelegate {
    
    lazy var baseView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ActionSheet: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
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
        view.addSubview(ActionSheet)
        
        baseView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        baseView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        baseView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        baseView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        ActionSheet.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        ActionSheet.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        ActionSheet.topAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        ActionSheet.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ActionSheetAnimation(false)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ActionSheetAnimation(true)
    }

}
