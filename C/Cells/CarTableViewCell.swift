//
//  CarTableViewCell.swift
//  C
//
//  Created by Tiago de Freitas Costa on 2024-07-13.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    private lazy var carPosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var carTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var carReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white.withAlphaComponent(0.75)
        return label
    }()
    
    // function to show the [Car] array in the table. This will be called in CarsViewController
    func configureCell(car: Car) {
        carTitleLabel.text = car.title
        carPosterImageView.image = UIImage(named: car.image)
        carReleaseDateLabel.text = "Release: \(car.releaseDate)"
    }
    
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
            carTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -16),
            carTitleLabel.leadingAnchor.constraint(equalTo: carPosterImageView.trailingAnchor, constant: 16),
            carTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
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
