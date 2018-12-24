//
//  TwoPageManagerController.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/24.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit

class TwoPageManagerController: UIViewController, HeaderSlideDelegate {
    
    @IBOutlet weak var underlineView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = self.children.map({
            guard let viewController = $0 as? HeadSliderViewController else { return }
            viewController.delegate = self
        })
    }
    
    func slideUnderLine(_ status: HeaderStatus) {
        switch status {
        case .right: underlineToRightFromLeft()
        case .left: underlineToLeftFromRight()
        }
    }

    func underlineToRightFromLeft() {
        UIView.animate(withDuration: 0.3, animations: {
            self.underlineView.transform = CGAffineTransform(translationX: self.view.frame.width / 2, y: 0)
        })
    }
    
    func underlineToLeftFromRight() {
        UIView.animate(withDuration: 0.3, animations: {
            self.underlineView.transform = CGAffineTransform.identity
        })
    }
    
}
