//
//  CustomizeViewController.swift
//  GTMRefreshDemo
//
//  Created by WhatsXie on 2017/9/19.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

import UIKit

class CustomizeViewController: AllTableViewViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let section1 = SectionModel(rowsCount: 7,
                                    sectionTitle:"Customize",
                                    rowsTitles: ["QQ","YahooWeather","Curve Mask","Youku","TaoBao","QQ Video","DianPing"],
                                    rowsTargetControlerNames:["QQStyleHeaderViewController","YahooWeatherTableViewController","CurveMaskTableViewController","YoukuTableViewController","TaobaoTableViewController","QQVideoTableviewController","DianpingTableviewController"])
        setRefreshDataWithSectionModel(section: section1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
