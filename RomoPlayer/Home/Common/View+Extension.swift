//
//  View+Extension.swift
//  RomoPlayer
//
//  Created by rouzbeh on 22.08.23.
//

import UIKit

extension UIView {
    func addLeading(to view: UIView, constant: CGFloat = 0) -> UIView {
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
        return self
    }
    
    func addTrailing(to view: UIView, constant: CGFloat = 0) -> UIView {
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
        return self
    }
    
    func addBottom(to view: UIView, constant: CGFloat = 0) -> UIView {
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = true
        return self
    }
    
    func addTop(to view: UIView, constant: CGFloat = 0) -> UIView {
        topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
        return self
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

