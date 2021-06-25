//
//  SeatCollectionView.swift
//  RCLiveModule
//
//  Created by crx on 2021/6/23.
//

import UIKit

/** 坐席视图 */
class SeatCollectionView: UICollectionView {
    
    init(frame: CGRect) {
        super.init(frame: frame, collectionViewLayout: Self.getCollectionViewFlowLayout(frame: frame))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 布局 & 常数
    
    private static func getCollectionViewFlowLayout(frame: CGRect) -> UICollectionViewFlowLayout {
        let minimumLineSpacing: CGFloat = 5
        let minimumInteritemSpacing: CGFloat = 10
        let sectionInset = UIEdgeInsets(top: 0, left: minimumInteritemSpacing, bottom: 0, right: minimumInteritemSpacing)
        let itemWidth = (frame.width - minimumInteritemSpacing*5) / 4.0
        let itemSize = CGSize(width: floor(itemWidth), height: 90)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = itemSize
        flowLayout.minimumLineSpacing = minimumLineSpacing
        flowLayout.minimumInteritemSpacing = minimumInteritemSpacing
        flowLayout.sectionInset = sectionInset
        return flowLayout
    }
    
}
