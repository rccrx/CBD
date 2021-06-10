//
//  RCLiveModulePublic.swift
//  RCLiveModule
//
//  Created by crx on 2021/6/10.
//

import UIKit

// 这个类要被OC使用，必须有一个继承父类，方法要加上@objc才会在自动生成的OC类中出现
public class RCLiveModulePublic: NSObject {
    
    // 创建直播视图控制器
    @objc public static func createLiveViewController() -> UIViewController {
        return LiveViewController()
    }
}

