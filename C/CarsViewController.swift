//
//  CarsViewController.swift
//  C
//
//  Created by Tiago de Freitas Costa on 2024-07-13.
//

import UIKit

class CarsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background // collor define in assets folder
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Iconic cars"
        navigationController?.navigationBar.prefersLargeTitles = true // change title size
        navigationController?.navigationBar.largeTitleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.white] // Change title color
        navigationItem.setHidesBackButton(true, animated: true) //delete  "back" button
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
