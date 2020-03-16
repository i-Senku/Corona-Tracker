//
//  NewsPage.swift
//  Corona Tracker
//
//  Created by ercan on 16.03.2020.
//  Copyright © 2020 Ercan. All rights reserved.
//

import UIKit
import SwiftOverlays

class NewsPage: UITableViewController {
    
    var myTableView : [ResultNewsData] = [ResultNewsData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        tableView.register(NewsCell.self, forCellReuseIdentifier: "newsCell")
        tableView.rowHeight = view.bounds.size.height * 0.2
        
        tableView.separatorStyle = .none
        
        view.addSubview(self.showWaitOverlay())
        
        CoronaTrackerService.getNews { (newsData) in
            self.myTableView = newsData.results
            self.tableView.reloadData()
            self.removeAllOverlays()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTableView.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
        cell.selectionStyle = .none
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy hh:mm"
        cell.time.text = "🕑 \(dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(myTableView[indexPath.row].pubDate) / 1000)))"
        cell.sourceName.text = " " + myTableView[indexPath.row].infoSource + " "
        cell.viewSource.restorationIdentifier = myTableView[indexPath.row].sourceUrl
        cell.viewSource.addTarget(self, action: #selector(showTweet(sender:)), for: .touchUpInside)

        
        return cell
    }
    
    @objc func showTweet(sender : Any){
        
        if let button = sender as? UIButton{
            if let url = button.restorationIdentifier {
                UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
            }
        }
        
    }
    
    

}

enum Vs: String {
  case pulse = "pulse"
  case precision = "precision"
}

class customTap: UITapGestureRecognizer {
  var cutomTag: String?
}
