//
//  CharacterCollectionViewController.swift
//  FamilyHouse
//
//  Created by Jacqueline Minneman on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class CharacterCollectionViewController: UICollectionViewController {
    
    var characters: [Character] = []
    var filmLocation: FilmLocation!
    var selectedCharacters: [Character] = []

    
    @IBOutlet var characterCollectionView: UICollectionView!

    @IBAction func doneButtonPressed(_ sender: AnyObject) {
        checkCharacterLocation()
        
    }
    
    
    func generateCharacters() {
        let carl = Character(name: "Carl", realLifename: "Carl", tvSeries: .familyMatters, currentLocation: filmLocation, image: #imageLiteral(resourceName: "carl"))
        let danny = Character(name: "Danny", realLifename: "Danny", tvSeries: .fullHouse, currentLocation: filmLocation, image: #imageLiteral(resourceName: "danny"))
        let eddie = Character(name: "Eddie", realLifename: "Eddie", tvSeries: .familyMatters, currentLocation: filmLocation, image: #imageLiteral(resourceName: "eddie"))
        let dj = Character(name: "DJ", realLifename: "DJ", tvSeries: .fullHouse, currentLocation: filmLocation, image: #imageLiteral(resourceName: "dj"))
        characters = [carl, danny, eddie, dj]

    }
    
    func checkCharacterLocation() {
        for character in selectedCharacters {
            print(filmLocation.name)
            if character.canReportToSet(on: filmLocation){
                print("Yes, \(character.name) can report.")
            } else {
                print("No, \(character.name) can't report.")
            }
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateCharacters()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return characters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterBasicCell", for: indexPath) as! CharacterCollectionViewCell
    
        let character = characters[indexPath.item]
        cell.character = character
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected")
        print(characterCollectionView.indexPathsForSelectedItems)
        let cell = collectionView.cellForItem(at: indexPath) as! CharacterCollectionViewCell
        
        cell.characterNameLabel.backgroundColor = UIColor.cyan
    
        selectedCharacters.append(cell.character)
            

    }
}
