//
//  CarDetailsViewController.swift
//  C
//
//  Created by Tiago de Freitas Costa on 2024-07-14.
//

import UIKit

class CarDetailsViewController: UIViewController {
    
    private var car: Car
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = car.title
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 28.0, weight: .bold)
        return label
    }()
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: car.image))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 32.0
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var userRatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User Rating: \(car.rate)"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white.withAlphaComponent(0.75)
        label.attributedText = justifiedText(for: car.description)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubviews()
        setupConstraints()
    }
    
    private func justifiedText(for text: String) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        paragraphStyle.hyphenationFactor = 1.0
        
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .foregroundColor: UIColor.white.withAlphaComponent(0.75)
        ]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(posterImageView)
        view.addSubview(userRatingLabel)
        view.addSubview(descriptionLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // titleLabel constraints
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            
            // posterImageView constraints
            posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: 250.0),
            posterImageView.heightAnchor.constraint(equalToConstant: 300.0),
            posterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32.0),
            
            // userRatingLabel constraints
            userRatingLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 32.0),
            userRatingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // descriptionLabel constraints
            descriptionLabel.topAnchor.constraint(equalTo: userRatingLabel.bottomAnchor, constant: 32.0),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
        ])
    }
    
    init(car: Car) {
        self.car = car
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

