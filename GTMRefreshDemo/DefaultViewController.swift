//
//  DefaultViewController.swift
//  GTMRefreshDemo
//
//  Created by WhatsXie on 2017/9/19.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

import UIKit

class DefaultViewController: AllTableViewViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let section0 = SectionModel(rowsCount: 4,
                                    sectionTitle:"Default",
                                    rowsTitles: ["Tableview","CollectionView","ScrollView","WebView"],
                                    rowsTargetControlerNames:["DefaultTableViewController","DefaultCollectionViewController","DefaultScrollViewController","DefaultWebViewController"])
        setRefreshDataWithSectionModel(section: section0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
