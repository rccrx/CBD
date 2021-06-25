//
//  EmptySeatCollectionViewCell.swift
//  RCLiveModule
//
//  Created by crx on 2021/6/23.
//

import UIKit

/** 空坐席cell */
class EmptySeatTableViewCell: UICollectionViewCell {
    
    /** 坐席图标 */
    let iconImageView = UIImageView()
    /** 坐席标题 */
    let titleLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconImageView.frame = CGRect(x: iconX, y: iconY, width: iconWH, height: iconWH)
        iconImageView.backgroundColor = .systemPink
        
        titleLabel.frame = CGRect(x: titleX, y: titleY, width: titleWidth, height: titleHeight)
        titleLabel.font = UIFont.systemFont(ofSize: titleFontSize)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 布局 & 常数
    
    private let iconWH: CGFloat = 45
    private var iconX: CGFloat { (frame.width - iconWH) * 0.5 }
    private let iconY: CGFloat = 0
    
    private let titleFontSize: CGFloat = 11
    private var titleHeight: CGFloat { titleFontSize + 4 /* 4为行间距 */ }
    private var titleWidth: CGFloat { frame.width }
    private let titleX: CGFloat = 0
    private var titleY: CGFloat { iconImageView.frame.maxY + 5 /* 5为title和icon间距 */ }
    
}

