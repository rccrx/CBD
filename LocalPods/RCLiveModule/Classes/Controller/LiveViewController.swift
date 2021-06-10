//
//  LiveViewController.swift
//  RCLiveModule
//
//  Created by crx on 2021/6/10.
//

import UIKit

class LiveViewController: UIViewController {
    private var originalNavigationBarHidden: Bool?
    
    // MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let exitButton = UIButton(frame: CGRect(x: 300, y: 50, width: 50, height: 50))
        exitButton.setTitle("退出", for: .normal)
        exitButton.addTarget(self, action: #selector(exitButtonOnClick(_:)), for: .touchUpInside)
        exitButton.backgroundColor = .blue
        view.addSubview(exitButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        originalNavigationBarHidden = navigationController?.isNavigationBarHidden;
        if let navBarHidden = originalNavigationBarHidden, navBarHidden == false {
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let navBarHidden = originalNavigationBarHidden, navBarHidden == false {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    // MARK: - 点击事件
    @objc func exitButtonOnClick(_ button: UIButton) {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}
