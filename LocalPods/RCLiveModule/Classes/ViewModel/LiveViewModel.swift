//
//  LiveViewModel.swift
//  RCLiveModule
//
//  Created by crx on 2021/6/24.
//

import Foundation

/** 直播的ViewModel */
class LiveViewModel: NSObject {
    
    /** 坐席数据，为了KVO监测变化而使用“OC类型+var+@objc”，元素类型SeatInfo */
    @objc private(set) var seatInfos = NSMutableArray()
    
    func requestSeatInfos() -> Void {
        // 获取假数据
        let deadline = DispatchTime.now() + .milliseconds(500)
        DispatchQueue.global().asyncAfter(deadline: deadline) {
            DispatchQueue.main.async {
                self.seatInfos.removeAllObjects()
                for index in 1...8 {
                    var seat: SeatInfo
                    if index == 2 {
                        seat = SeatInfo(iconURL: "https://img2.baidu.com/it/u=3436121203,3749922833&fm=26&fmt=auto&gp=0.jpg", nickname: "哆啦A梦")
                    } else {
                        seat = SeatInfo()
                    }
                    self.seatInfos.add(seat)
                }
                self.setValue(self.seatInfos, forKeyPath: #keyPath(LiveViewModel.seatInfos)) // 触发KVO
            }
        }
    }
    
}
