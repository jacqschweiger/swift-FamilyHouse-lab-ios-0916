//
//  FilmLocationTableViewController.swift
//  FamilyHouse
//
//  Created by Jacqueline Minneman on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FilmLocationTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var filmLocations = [FilmLocation]()

    func generateFilmLocations() {
        let chicago = FilmLocation(name: "Chicago", address: "123 Main Street", tvSeries: .familyMatters)
        let sanfran = FilmLocation(name: "San Francisco", address: "345 Main Street", tvSeries: .fullHouse)
        filmLocations = [chicago, sanfran]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateFilmLocations()
        
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmLocations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath) as! FilmLocationTableViewCell
        let filmLocation = filmLocations[indexPath.row]
        cell.filmLocation = filmLocation
        return cell
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let dest = segue.destination as? CharacterCollectionViewController {
                if let selectedPath = tableView.indexPathForSelectedRow { //current
                    dest.filmLocation = filmLocations[selectedPath.row] //instance version of where you're going = dest.filmLocation, like a class of CharacterCollectionViewController, can access stuff in the "class" like labels, etc.
                }
            }
        }
        
    }



}














