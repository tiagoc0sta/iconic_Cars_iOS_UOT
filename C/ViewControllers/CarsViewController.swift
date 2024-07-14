//
//  CarsViewController.swift
//  C
//
//  Created by Tiago de Freitas Costa on 2024-07-13.
//

import UIKit

class CarsViewController: UIViewController {
    
    // creating the table to display the cars
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear //show the backgound color
        tableView.dataSource = self // defines that CarsViewController is the data source
        tableView.delegate = self // defines that CarsViewController defines the behaivour of the table
        tableView.register(CarTableViewCell.self, forCellReuseIdentifier: "carCell")
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background // collor define in assets folder
        setupNavigationBar()
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        title = "Iconic cars"
        navigationController?.navigationBar.prefersLargeTitles = true // change title size
        navigationController?.navigationBar.largeTitleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.white] // Change title color
        navigationItem.setHidesBackButton(true, animated: true) //delete  "back" button
    }

}

// table logic
extension CarsViewController: UITableViewDataSource, UITableViewDelegate {
    // mandatory method when using UITableViewDataSource - related to data in a table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    // mandatory method when using UITableViewDataSource - related to data in a table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as? CarTableViewCell {
            cell.configureCell(car: cars[indexPath.row]) //calling configureCell function from CarTableViewCell
            cell.selectionStyle = .none // disable shadow when press button
            return cell
        }
        return UITableViewCell() // In case of an error, it will return any cell
    }
    
    // method acts when selecting a cell
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsVC = CarDetailsViewController(car: cars[indexPath.row])
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    // define table height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
