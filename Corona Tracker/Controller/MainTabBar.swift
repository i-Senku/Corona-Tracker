import UIKit

final class MainTabBar: UITabBarController {
    
    let timeLinePage = TimeLinePage()
    let infoPage = StatisticsPage()
    let coron = CoronaMaps()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createTabBar(title: "Home", image: "waveform.path.ecg", vc: infoPage),
            createTabBar(title: "Maps", image: "map", vc: coron),
            createTabBar(title: "Time Line", image: "pencil.and.outline", vc: timeLinePage)
        ]
        
    }
    
    fileprivate func createTabBar(title:String,image:String,vc:UIViewController)->UINavigationController{
        let recenVC = UINavigationController(rootViewController: vc)
        recenVC.tabBarItem.title = title
        recenVC.tabBarItem.image = UIImage(systemName: image)
        return recenVC
    }
    

}
