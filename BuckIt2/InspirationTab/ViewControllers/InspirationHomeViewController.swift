//
//  InspirationHomeViewController.swift
//  BuckIt
//
//  Created by Eric Andersen on 10/11/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class InspirationHomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var inspirationSearchBar: UISearchBar!
    @IBOutlet weak var inspirationCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUPUI()
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

extension InspirationHomeViewController: InspirationLayoutDelegate {
    
    func setUPUI() {
        inspirationCollectionView.delegate = self
        inspirationCollectionView.dataSource = self
        guard let layout = inspirationCollectionView.collectionViewLayout as? InspirationLayout else { return }
        layout.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 225
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inspirationCell", for: indexPath) as? InspirationCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    
}
