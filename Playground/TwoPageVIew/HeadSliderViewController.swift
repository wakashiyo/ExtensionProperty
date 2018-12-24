//
//  HeadSliderViewController.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/24.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit

class HeadSliderViewController: UIViewController, HeaderSlidable {
    
    var delegate: HeaderSlideDelegate?

    @IBOutlet weak var leftButton: UIButton!
    
    @IBOutlet weak var rightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
    }

    @objc
    func leftButtonTapped() {
        sendStatus(.left)
    }
    
    @objc
    func rightButtonTapped() {
        sendStatus(.right)
    }
}
