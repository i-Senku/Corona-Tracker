import UIKit
import SwiftOverlays

final class TimeLinePage: UIViewController {
    
    let home : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let myTableView : UITableView = {
       let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        return view
    }()
    
    var timeLineList = [Expandable]()
    var bigSection = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Time Line"
        view.backgroundColor = .white
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.register(TimeLineCell.self, forCellReuseIdentifier: "timeline")
        setupView()
        fethTimeLine()
        
    }

}

extension TimeLinePage{
    func setupView(){
        view.addSubview(home)
        view.addSubview(myTableView)
        
        NSLayoutConstraint.activate([
            myTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1),
            myTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            
            home.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            home.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            home.widthAnchor.constraint(equalToConstant: 0),
            home.heightAnchor.constraint(equalToConstant: 0)
            
        ])
    }
}

extension TimeLinePage : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.tag = section
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showSection(sender:))))
        
        
        let image = UIImageView(image: UIImage(systemName: "calendar"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .white
        view.addSubview(image)
        
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        image.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let titleView = UILabel()
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.text = timeLineList[section].title
        titleView.font = .boldSystemFont(ofSize: 20)
        titleView.textColor = .white
        view.addSubview(titleView)
        
        titleView.leadingAnchor.constraint(equalTo: image.trailingAnchor,constant: 10).isActive = true
        titleView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    @objc func showSection(sender:UITapGestureRecognizer){
        var section = 0
        if let tag = sender.view?.tag {
            section = tag
        }
                
        if timeLineList[section].isOpen{
            timeLineList[section].isOpen = false
            let indexSet = IndexSet.init(integer: section)
            myTableView.reloadSections(indexSet, with: .fade)
        }else{
            timeLineList[section].isOpen = true
            let indexSet = IndexSet.init(integer: section)
            myTableView.reloadSections(indexSet, with: .fade)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return timeLineList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if timeLineList[section].isOpen {
            return timeLineList[section].sectionData.count
        }else{
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeline") as! TimeLineCell
        cell.dateText.text = timeLineList[indexPath.section].sectionData[indexPath.row].description!
        cell.viewIcon.image = UIImage(systemName: "arrowshape.turn.up.right.fills")
        cell.viewIcon.tintColor = .darkGray
        return cell
    }
    
    private func fethTimeLine(){
        showWaitOverlay()
        CoronaTrackerService.getTimeLine { (timeLines) in
            let _ = timeLines.map { (timeLineData) -> Void in
                self.timeLineList.append(Expandable(isOpen: false, title: timeLineData.date, sectionData: timeLineData.time))
            }
            print(timeLines.count)
            self.myTableView.separatorStyle = .singleLine
            self.myTableView.reloadData()
            self.removeAllOverlays()
            
        }
    }
    
    
}
