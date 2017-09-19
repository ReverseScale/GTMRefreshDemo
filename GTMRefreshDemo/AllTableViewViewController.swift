//
//  DefaultViewController.swift
//  GTMRefreshDemo
//
//  Created by WhatsXie on 2017/9/19.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

import UIKit
import GTMRefresh

class AllTableViewViewController: UITableViewController {
    var models = [SectionModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func setRefreshDataWithSectionModel(section:SectionModel) {
        models.append(section)
        
        self.tableView.gtm_addRefreshHeaderView {
            [weak self] in
            print("excute refreshBlock")
            self?.refresh()
        }

        self.tableView.gtm_addLoadMoreFooterView {
            [weak self] in
            print("excute loadMoreBlock")
            self?.loadMore()
        }
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)

        // text
        self.tableView.pullDownToRefreshText("下拉来刷新页面")
            .releaseToRefreshText("请松手")
            .refreshSuccessText("已刷新成功")
            .refreshFailureText("未能刷新成功")
            .refreshingText("正在刷新操作")
        // color
        self.tableView.headerTextColor(.black)
        // icon
        self.tableView.headerIdleImage(UIImage.init(named: "arrow_down@3x"))
    }
    // MARK: Test
    func refresh() {
        perform(#selector(endRefresing), with: nil, afterDelay: 3)
    }
    
    func endRefresing() {
        self.tableView.endRefreshing(isSuccess: true)
    }
    func loadMore() {
        perform(#selector(endLoadMore), with: nil, afterDelay: 3)
    }
    
    func endLoadMore() {
        self.tableView.endLoadMore(isNoMoreData: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension AllTableViewViewController {
    // MARK: Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionModel = models[section]
        return sectionModel.sectionTitle
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionModel = models[section]
        return sectionModel.rowsCount
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            
        }
        let sectionModel = models[(indexPath as NSIndexPath).section]
        cell?.textLabel?.text = sectionModel.rowsTitles[(indexPath as NSIndexPath).row]
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sectionModel = models[(indexPath as NSIndexPath).section]
        var className = sectionModel.rowsTargetControlerNames[(indexPath as NSIndexPath).row]
        className = "GTMRefreshDemo.\(className)"
        if let cls = NSClassFromString(className) as? UIViewController.Type{
            let dvc = cls.init()
            self.navigationController?.pushViewController(dvc, animated: true)
        }
        
    }

}
