//
//  CarTableViewCell.swift
//  C
//
//  Created by Tiago de Freitas Costa on 2024-07-13.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    private lazy var carPosterImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.fordMustang)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private lazy var carTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mustang"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var carReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Release: 1964"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white.withAlphaComponent(0.75)
        return label
    }()
    
    private func addSubviews() {
        addSubview(carPosterImageView)
        addSubview(carTitleLabel)
        addSubview(carReleaseDateLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            //carPosterImageView constraints
            carPosterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            carPosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            carPosterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            carPosterImageView.widthAnchor.constraint(equalToConstant: 100),
            
            //movieTitleLabel constraints
            carTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            carTitleLabel.leadingAnchor.constraint(equalTo: carPosterImageView.trailingAnchor, constant: 16),
            
            //carReleaseDateLabel constraints
            carReleaseDateLabel.topAnchor.constraint(equalTo: carTitleLabel.bottomAnchor, constant: 8),
            carReleaseDateLabel.leadingAnchor.constraint(equalTo: carPosterImageView.trailingAnchor, constant: 16)
        ])
        
    }
    
    //as this is not a controller file and there is no viewDidLoad, we need to use initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

/*
 #Preview {
 CarTableViewCell()
 }
 */
