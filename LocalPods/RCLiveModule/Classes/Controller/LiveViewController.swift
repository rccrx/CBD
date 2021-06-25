//
//  LiveViewController.swift
//  RCLiveModule
//
//  Created by crx on 2021/6/10.
//

import UIKit

/** 直播页面 */
class LiveViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    /** 进入这个页面之前的导航栏隐藏状态 */
    private var originalNavigationBarHidden: Bool?
    /** 坐席 */
    private var seatCollectionView: SeatCollectionView!
    /** 直播VM */
    private let liveViewModel = LiveViewModel()
    
    
    // MARK: - 生命周期
    deinit {
        removeObservers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addObservers()
        requestData()
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
    
    // MARK: - 界面布置
    private func setupUI() -> Void {
        view.backgroundColor = .white
        
        let exitButton = UIButton(frame: CGRect(x: 300, y: 50, width: 50, height: 50))
        exitButton.setTitle("退出", for: .normal)
        exitButton.addTarget(self, action: #selector(exitButtonOnClick(_:)), for: .touchUpInside)
        exitButton.backgroundColor = .blue
        view.addSubview(exitButton)
        
        seatCollectionView = SeatCollectionView(frame: seatCollectionViewFrame)
        seatCollectionView.delegate = self
        seatCollectionView.dataSource = self
        seatCollectionView.register(EmptySeatTableViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(EmptySeatTableViewCell.self))
        view.addSubview(seatCollectionView)
    }
    
    // MARK: - 观察者
    private func addObservers() -> Void {
        liveViewModel.addObserver(self, forKeyPath: #keyPath(LiveViewModel.seatInfos), options: .new, context: nil)
    }
    
    private func removeObservers() -> Void {
        liveViewModel.removeObserver(self, forKeyPath: #keyPath(LiveViewModel.seatInfos))
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if object as! NSObject == liveViewModel && keyPath == #keyPath(LiveViewModel.seatInfos) {
            seatCollectionView.reloadData()
        }
    }
    
    // MARK: - 数据请求
    private func requestData() -> Void {
        liveViewModel.requestSeatInfos()
    }
    
    // MARK: - 点击事件
    @objc private func exitButtonOnClick(_ button: UIButton) {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - collectionView 协议
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        liveViewModel.seatInfos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: 需要添加非空坐席cell
        let seatInfo = liveViewModel.seatInfos[indexPath.row] as! SeatInfo
        let cell: EmptySeatTableViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(EmptySeatTableViewCell.self), for: indexPath) as! EmptySeatTableViewCell
        if let iconURL = seatInfo.iconURL, let nickname = seatInfo.nickname {
            cell.iconImageView.sd_setImage(with: URL(string: iconURL), placeholderImage: nil, options: SDWebImageOptions(rawValue: 0), completed: nil)
            cell.titleLabel.text = nickname
        } else {
            cell.titleLabel.text = "\(indexPath.row+1)号麦位"
        }
        
        return cell
    }
    
    
    // MARK: - 布局 & 常数
    private var seatCollectionViewFrame: CGRect {
        CGRect(x: 0, y: 100, width: view.frame.width, height: 200)
    }
    
}
