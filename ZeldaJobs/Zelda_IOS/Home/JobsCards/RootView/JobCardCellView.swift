//
//  JobCardCellView.swift
//  ZeldaJobs
//
//  Created by Hossam on 28/04/2021.
//

import UIKit
import SwiftUI
class JobCardCellView : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configContainerViewStyle()
        buildViewHeirarchy()
        buildViewConstraints()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    lazy var logoView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.cornerCurve = .continuous
        
        let logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(systemName: "applelogo")
        logoImage.contentMode = .scaleAspectFit
        logoImage.tintColor = .black
        
        
        view.addSubview(logoImage)
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 60),
            view.heightAnchor.constraint(equalToConstant: 60),
            
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            logoImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            logoImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
        ])
        
        return view
    }()
    
    
    lazy var companyTitle : UILabel = {
        let label = UILabel()
        label.text = "Apple.lnk"
        label.font = UIFont.rounded(ofSize: 16, weight: .thin)
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var jobTitle : UILabel = {
        let label = UILabel()
        label.text = "iOS Developer"
        label.font = UIFont.rounded(ofSize: 26, weight: .regular)
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var salaryTitle : UILabel = {
        let label = UILabel()
        label.text = "$ 40K Yearly"
        label.font = UIFont.rounded(ofSize: 16, weight: .thin)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false 
        return label
    }()
    
        lazy var  componentContainer : UIView  = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .red
            return view
        }()
    lazy var containerStack : UIStackView = {
       let stack =  UIStackView(arrangedSubviews: [logoView , companyTitle , jobTitle])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
        return stack
    }()
    func buildViewConstraints(){
       
        
        
        
        NSLayoutConstraint.activate([
            componentContainer.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.60),
            componentContainer.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            componentContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            componentContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            
            containerStack.widthAnchor.constraint(equalTo: componentContainer.widthAnchor , multiplier: 1),
            containerStack.heightAnchor.constraint(equalTo: componentContainer.heightAnchor , multiplier: 0.5),
            containerStack.topAnchor.constraint(equalTo: componentContainer.topAnchor , constant: 30),
            containerStack.centerXAnchor.constraint(equalTo: componentContainer.centerXAnchor),
            componentContainer.bottomAnchor.constraint(equalTo: salaryTitle.bottomAnchor, constant: 30),
            componentContainer.centerXAnchor.constraint(equalTo: salaryTitle.centerXAnchor)
        ])
        
    }
    
    func buildViewHeirarchy(){
        contentView.addSubview(componentContainer)
        componentContainer.addSubview(containerStack)
        componentContainer.addSubview(salaryTitle)
        
    }
    func configContainerViewStyle(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = contentView.bounds
        
        gradientLayer.colors = [#colorLiteral(red: 0.04705882353, green: 0.04705882353, blue: 0.04705882353, alpha: 1).cgColor , #colorLiteral(red: 0.168627451, green: 0.168627451, blue: 0.168627451, alpha: 1).cgColor]
        gradientLayer.startPoint = .init(x: 0.5, y: 1)
        gradientLayer.endPoint = .init(x: 0.5, y: 0)
        componentContainer.layer.addSublayer(gradientLayer)
        
        componentContainer.layer.masksToBounds = true
        componentContainer.layer.cornerRadius = 55
        componentContainer.layer.cornerCurve = .continuous
    }
    
    
    
}


