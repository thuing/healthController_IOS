//
//  patientVisitViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/23.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit

class patientVisitViewController: UIViewController {
    
    let bgView = UIView()
    let tableTool = UITableTool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    func setView(){
        
        bgView.backgroundColor = UIColor.white
        view.addSubview(bgView)
        bgView.snp.makeConstraints{(make) in
            make.width.height.equalToSuperview()
            make.top.equalTo(60)
            make.center.equalToSuperview()
        }
        
        let table1 = UIView()
        bgView.addSubview(table1)
        table1.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.top.equalTo(10)
        }
        
        let table2 = UIView()
        bgView.addSubview(table2)
        table2.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.top.equalTo(table1.snp.bottom)
        }
        
        let table3 = UIView()
        bgView.addSubview(table3)
        table3.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.top.equalTo(table2.snp.bottom)
        }
        
        tableTool.tableCell(table:table1,labelStr: "就诊卡号：", placeholderStr: "请输入就诊卡号")
        tableTool.tableCell(table:table2,labelStr: "医生编号：", placeholderStr: "请输入编号")
        tableTool.tableCell(table:table3,labelStr: "初诊日期：", placeholderStr: "")
        
        let submitBtn = UIButton()
        bgView.addSubview(submitBtn)
        submitBtn.setTitle("提交", for: .normal)
        submitBtn.layer.cornerRadius = 5
        submitBtn.layer.backgroundColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        submitBtn.snp.makeConstraints{(make) in
            make.width.equalTo(280)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(table3.snp.bottom).offset(10)
        }
    }
    
    
}
