//
//  HeadSliderViewController.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/24.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit

//PageViewControllerの上部に配置する2つの切り替えボタンを配置したViewController
class HeadSliderViewController: UIViewController, HeaderSlidable {
    
    //Protocols.swift参照
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
