//
//  View+Extension.swift
//  RomoPlayer
//
//  Created by rouzbeh on 22.08.23.
//

import UIKit

extension UIView {
    func addLeading(to view: UIView, constant: CGFloat = 0) {
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
    }
    
    func addTrailing(to view: UIView, constant: CGFloat = 0){
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
    }
    
    func addBottom(to view: UIView, constant: CGFloat = 0){
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = true
    }
    
    func addTop(to view: UIView, constant: CGFloat = 0)  {
        topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
    }
    
    func addConstraintsToEdges(of view: UIView, insets: UIEdgeInsets = .zero) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.right),
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom)
        ])
    }
}

