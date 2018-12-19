
//
//  ManagerViewController.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/16.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit

//サイドメニューとその上に乗っているメインのコンテンツを管理するViewController
class ManagerViewController: UIViewController, SliderDelegate {
    
    //containerview of sidemenu
    lazy var sideContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //containerview of mainmenu
    lazy var mainContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //left side of mainContainer add shadow
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor //色
        view.layer.shadowOpacity = 0.5 // 透明度
        view.layer.shadowOffset = CGSize(width: -4, height: 2) // 距離
        view.layer.shadowRadius = 5 // ぼかし量
        return view
    }()
    
    //viewcontroller of mainmenu
    var mainVC: UIViewController!
    
    //viewcontroller of sidemenu
    var sideVC: UIViewController!
    
    //when display sidemenu, this button wrapped maincontainer
    lazy var slideCloseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeSlide), for: .touchUpInside)
        return button
    }()
    
    init(_ main: UIViewController, _ side: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        self.mainVC = main
        self.sideVC = side
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //各ContainerViewのレイアウトを決定する
        layoutContainer()
        //各ViewContollerをaddChildViewControllerする
        addChildViewController(sideVC, sideContainer)
        addChildViewController(mainVC, mainContainer)
        
        //メインのコンテンツ用のVCの型はUIViewControllerだが、
        //サイドメニューの開く時のデリゲートを持っていないので、
        //UINavigationController → MainViewControllerへとかキャストしている
        //⭐️キャストする処理を無くしたいので、型の定義など、要修正
        guard let nav = mainVC as? UINavigationController else { return }
        print("nav")
        guard let main = nav.viewControllers[0] as? MainViewController else { return }
        print("main")
        main.delegate = self
    }
    
    //add childViewController
    func addChildViewController(_ vc: UIViewController, _ view: UIView) {
        self.addChild(vc)
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
    
    /*
      mainContainer over the sideContainer
      mainContainer layout equal to layout of superview in ViewController
      sideContainer layout eaual to leading, top, bottom of superview in ViewController
      width of sideContainer is any value
    */
    
    func layoutContainer() {
        view.addSubview(sideContainer)
        view.addSubview(mainContainer)
        
        //サイドメニューを入れるContainerViewのレイアウトは
        //左側,上部,下部はViewControllerのViewのAnchorに合わせる
        //幅だけ、定数で調整
        //幅の定数の定義については要修正
        sideContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        sideContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        sideContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        sideContainer.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        mainContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    //animation of display sidemenu
    func showSlide() {
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.mainContainer.transform = CGAffineTransform(translationX: 250, y: 0)
        },
                       completion: { bool in
                        //メインのコンテンツ用のContainerView全体にサイドメニューを閉じる用のボタンを配置する
                        self.mainContainer.addSubview(self.slideCloseButton)
                        self.slideCloseButton.leadingAnchor.constraint(equalTo: self.mainContainer.leadingAnchor).isActive = true
                        self.slideCloseButton.topAnchor.constraint(equalTo: self.mainContainer.topAnchor).isActive = true
                        self.slideCloseButton.trailingAnchor.constraint(equalTo: self.mainContainer.trailingAnchor).isActive = true
                        self.slideCloseButton.bottomAnchor.constraint(equalTo: self.mainContainer.bottomAnchor).isActive = true
        })
    }
    
    //animation of close sidemenu
    @objc
    func closeSlide() {
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.mainContainer.transform = CGAffineTransform.identity
        },
                       completion: { bool in
                        //delete slideCloseButton
                        self.mainContainer.subviews.last?.removeFromSuperview()
        })
    }

}
