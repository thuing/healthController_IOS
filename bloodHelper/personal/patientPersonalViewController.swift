//
//  patientPersonalViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/23.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit

class patientPersonalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var tableView:UITableView!
    
    var allItems:Array<String> = []
    var allItemsIcon:Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化数据
        self.allItems = ["患者个人信息填写","患者初诊血常规填写"]
        self.allItemsIcon = ["个人信息","患者血常规"]
        
        //创建表视图
        tableView = UITableView(frame:self.view.frame, style:.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        //创建一个重用的单元格
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "patientCell")
        view.addSubview(tableView)
        
        setView()
    }
    
    func setView(){
        
        // 背景view 患者身份图标
        let backView = UIView()
        view.addSubview(backView)
        backView.backgroundColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0)
        backView.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.height.equalTo(200)
            make.top.equalTo(topLayoutGuide.snp.top).offset(60)
            make.centerX.equalToSuperview()
        }
        
        let patientIcon = UIImageView(image: UIImage(named: "患者身份"))
        patientIcon.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        backView.addSubview(patientIcon)
        patientIcon.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(10)
            make.center.equalToSuperview()
        }
        
        tableView.snp.makeConstraints{ (make) in
            make.width.equalToSuperview()
            make.height.equalTo(150)
            make.top.equalTo(backView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        //  查找附近数据检测机构
        let findNearInstitutionBtn = UIButton()
        view.addSubview(findNearInstitutionBtn)
        findNearInstitutionBtn.setTitle("查找附近数据检测机构", for: .normal)
        findNearInstitutionBtn.layer.cornerRadius = 5
        findNearInstitutionBtn.layer.backgroundColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        findNearInstitutionBtn.addTarget(self, action: #selector(patientMap), for: UIControlEvents.touchUpInside)
        findNearInstitutionBtn.snp.makeConstraints{(make) in
            make.width.equalTo(280)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(tableView.snp.bottom).offset(40)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = self.allItems
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify:String = "patientCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identify,for: indexPath as IndexPath) as UITableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: allItemsIcon[indexPath.row])
        cell.textLabel?.text = allItems[indexPath.row]
        
        return cell
    }
    
    
    // UITableViewDelegate 方法，处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView!.deselectRow(at: indexPath as IndexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            patientInfo()
            break
        case 1:
            patientNormal()
            break
        default:
            print("tableView 有误")
        }
        
        
    }
    
    // 跳转到患者个人信息填写
    func patientInfo(){
        let pVC = patientInfoViewController()
        self.navigationController?.pushViewController(pVC, animated: true)
    }
    
    // 跳转到患者初诊血常规填写
    func patientNormal() {
        let pVC = patientNormalViewController()
        self.navigationController?.pushViewController(pVC, animated: true)
    }
    
    // 跳转到地图
    @objc  func patientMap(_ button :UIButton) {
        let pVC = patientMapViewController()
        self.navigationController?.pushViewController(pVC, animated: true)
    }
    
    
}
