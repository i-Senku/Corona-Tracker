
import UIKit
import WebKit
import SwiftOverlays

final class CoronaMaps: UIViewController {
    
    let progressBar : UIProgressView = {
        let view = UIProgressView(progressViewStyle: .default)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .purple
        view.progress = 0.0
        return view
    }()
    
    let webView : WKWebView = {
       let view = WKWebView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var estimatedProgressObserver: NSKeyValueObservation?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupEstimatedProgressObserver()
        title = "Maps"
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .white
        let url = URL(string: "https://www.google.com/maps/d/u/0/embed?mid=1a04iBi41DznkMaQRnICO40ktROfnMfMx&ll=42.37672518199583%2C10.1953125&z=2")
        webView.load(URLRequest(url: url!))
        
        setupView()
        
    }
    
    func setupEstimatedProgressObserver() {
        showWaitOverlay()
        estimatedProgressObserver = webView.observe(\.estimatedProgress, options: [.new]) { [weak self] webView, _ in
            
            self?.progressBar.progress += Float(webView.estimatedProgress)
            print((Float(webView.estimatedProgress)))
            
            if Float(webView.estimatedProgress) == 1 {
                print("Tamamlandı")
                self?.progressBar.alpha = 0
                //self?.removeAllOverlays()
            }
        }
    }
    
    private func setupView(){
        view.addSubview(progressBar)
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            progressBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            progressBar.heightAnchor.constraint(equalToConstant: 5)

        ])
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: progressBar.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
