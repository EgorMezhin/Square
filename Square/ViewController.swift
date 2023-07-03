//
//  ViewController.swift
//  Square
//
//  Created by Egor Mezhin on 03.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private struct Constants {
        static let cornerRadius = 8.0
        static let redColor = UIColor.red.cgColor
        static let orangeColor = UIColor.orange.cgColor
        static let yellowColor = UIColor.yellow.cgColor
        static let startPoint = CGPoint(x: 0, y: 0)
        static let endPoint = CGPoint(x: 1, y: 1)
    }
    
    private lazy var squareView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.cornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureGradient()
    }
}

extension ViewController {
    private func setupView() {
        view.addSubview(squareView)
        configureShadow()
        configureConstarints()
    }
    
    private func configureConstarints() {
        NSLayoutConstraint.activate([
            squareView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            squareView.widthAnchor.constraint(equalToConstant: 100),
            squareView.heightAnchor.constraint(equalTo: squareView.widthAnchor),
            squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func configureShadow() {
        squareView.layer.shadowColor = UIColor.orange.cgColor
        squareView.layer.shadowOpacity = 0.5
        squareView.layer.shadowOffset = CGSize(width: 5, height: -5)
        squareView.layer.shadowRadius = 5.0
        
    }
    
    func configureGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = Constants.startPoint
        gradientLayer.endPoint = Constants.endPoint
        gradientLayer.colors = [Constants.redColor,
                                Constants.yellowColor,
                                Constants.orangeColor
        ]
        gradientLayer.cornerRadius = 8
        gradientLayer.frame = squareView.bounds
        squareView.layer.addSublayer(gradientLayer)
    }
}

