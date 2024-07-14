//
//  ViewController.swift
//  C
//
//  Created by Tiago de Freitas Costa on 2024-07-13.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "backgroundImage") // Replace with your image name
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ICONIC CARS"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Legends on Wheels"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
        
    }()
    
    private lazy var welcomeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start here!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = UIColor.buttonBackground
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .background
        addSubViews()
        setUpConstraints()
    }
    
    @objc private func buttonPressed() {
        print("button pressed")
        navigationController?.pushViewController(CarsViewController(), animated: true) //navigate to another screen
        
    }
    
    func addSubViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(welcomeButton)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            // Background image constraints
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Welcome label constraints
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //subTitleLabel constraints
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            subTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //welcomeButton constraints
            welcomeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            welcomeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            welcomeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            welcomeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
/*
// Extension to define background color
extension UIColor {
    static var customBackground: UIColor {
        return UIColor.black // Replace with your desired background color if needed
    }
}*/
