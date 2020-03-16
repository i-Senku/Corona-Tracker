//
//  NewsCell.swift
//  Corona Tracker
//
//  Created by ercan on 16.03.2020.
//  Copyright © 2020 Ercan. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    let card : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .black
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = #colorLiteral(red: 0.9758957237, green: 0.9758957237, blue: 0.9758957237, alpha: 1)
        
        return view
    }()
    
    let leadingImage : UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "news")
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        
        return view
    }()
    
    let time : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "🕑 Zaman"
        view.textColor = .gray
        view.font = .monospacedSystemFont(ofSize: 12, weight: .medium)
        return view
    }()
    
    let title : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Borders between Spain and Portugal will close because of coronavirus restrictions"
        view.font = .monospacedSystemFont(ofSize: 13, weight: .medium)
        view.numberOfLines = 4
        return view
    }()
    
    let sourceName : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = " BBC "
        view.font = .monospacedSystemFont(ofSize: 13, weight: .medium)
        view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.5094465949, blue: 0.236253291, alpha: 1)
        view.textColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    let viewSource : UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.setImage(UIImage(systemName: "mostViewed"), for: .normal)
        view.setTitle("Read more", for: .normal)
        view.titleLabel?.font = .monospacedSystemFont(ofSize: 13, weight: .medium)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView(){
        addSubview(card)
        addSubview(leadingImage)
        addSubview(time)
        addSubview(sourceName)
        addSubview(title)
        addSubview(viewSource)

        
        NSLayoutConstraint.activate([
            card.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            card.rightAnchor.constraint(equalTo: rightAnchor,constant: -10),
            card.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            card.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9)
        ])
        
        NSLayoutConstraint.activate([
            leadingImage.leadingAnchor.constraint(equalTo: card.leadingAnchor),
            leadingImage.topAnchor.constraint(equalTo: card.topAnchor),
            leadingImage.bottomAnchor.constraint(equalTo: card.bottomAnchor),
            leadingImage.widthAnchor.constraint(equalTo: card.widthAnchor, multiplier: 0.30)
        ])
        
        NSLayoutConstraint.activate([
            sourceName.leadingAnchor.constraint(equalTo: leadingImage.trailingAnchor,constant:5),
            sourceName.topAnchor.constraint(equalTo: card.topAnchor,constant: 5),
            
        ])
        
        NSLayoutConstraint.activate([
            time.trailingAnchor.constraint(equalTo: card.trailingAnchor,constant: -5),
            time.topAnchor.constraint(equalTo: card.topAnchor,constant: 5),
            //time.leadingAnchor.constraint(equalTo: sourceName.trailingAnchor,constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingImage.trailingAnchor,constant: 5),
            title.trailingAnchor.constraint(equalTo: card.trailingAnchor,constant: -5),
            title.topAnchor.constraint(equalTo: sourceName.bottomAnchor,constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            viewSource.trailingAnchor.constraint(equalTo: card.trailingAnchor,constant: -10),
            viewSource.bottomAnchor.constraint(equalTo: card.bottomAnchor,constant: -5),
        ])
    }
    
    
    
}
