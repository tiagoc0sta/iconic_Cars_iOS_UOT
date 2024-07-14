//
//  CarsViewController.swift
//  C
//
//  Created by Tiago de Freitas Costa on 2024-07-13.
//

import UIKit

class CarsViewController: UIViewController {
    
    private var filteredCars: [Car] = [] //initialize variables to filter cars on the research bar
    private var isSearchActive: Bool = false
    
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
    
    //creating searchingBar
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "research"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.delegate = self
        return searchBar
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
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white] // Change title color
        navigationItem.setHidesBackButton(true, animated: true) //delete  "back" button
        navigationItem.titleView = searchBar
    }

}

// table logic
extension CarsViewController: UITableViewDataSource, UITableViewDelegate {
    // mandatory method when using UITableViewDataSource - related to data in a table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchActive ? filteredCars.count : cars.count
    }
    // mandatory method when using UITableViewDataSource - related to data in a table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as? CarTableViewCell {
            let car = isSearchActive ? filteredCars[indexPath.row] : cars [indexPath.row] //define wich array to use base on search active ot not
            cell.configureCell(car: car) //calling configureCell function from CarTableViewCell
            cell.selectionStyle = .none // disable shadow when press button
            return cell
        }
        return UITableViewCell() // In case of an error, it will return any cell
    }
    
    // method acts when selecting a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let car = isSearchActive ? filteredCars[indexPath.row] : cars [indexPath.row] //define wich array to use base on search active ot not
        let detailsVC = CarDetailsViewController(car: car)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    // define table height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

//capturing input from user on search bar and filtering
extension CarsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearchActive = false
        } else {
            isSearchActive = true
            filteredCars =  cars.filter({ car in
                car.title.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
}
