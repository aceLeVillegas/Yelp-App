//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating{
    
    @IBOutlet weak var yelpTableView: UITableView!
    
    var businesses: [Business]!
    var filteredData: [String]!
    var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        yelpTableView.dataSource = self
        yelpTableView.delegate = self
        
        yelpTableView.rowHeight = UITableViewAutomaticDimension
        yelpTableView.estimatedRowHeight = 330
       
       // Search Bar in Navigation Bar
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.sizeToFit()
        navigationItem.titleView = searchController.searchBar
        self.definesPresentationContext = true
        
        //navigationController?.navigationBar.barTintColor = UIColor.purple
        
        
       // Defalt Thai Search
        Business.searchWithTerm(term: "Thai", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            self.yelpTableView.reloadData()
            }
        )
        
        /* Example of Yelp search with more search options specified
         Business.searchWithTerm("Restaurants", sort: .distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: Error!) -> Void in
         self.businesses = businesses
         
         for business in businesses {
         print(business.name!)
         print(business.address!)
         }
         }
         */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = yelpTableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        
        cell.business = businesses[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(businesses != nil){
            return businesses!.count
        }
        else{
            return 0
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            
            Business.searchWithTerm(term: searchText, completion: { (businesses: [Business]?, error: Error?) -> Void in
                
                self.businesses = businesses
                self.yelpTableView.reloadData()
            })
            
        }
    }
    
}
