//
//  ViewController.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit
import MBProgressHUD



// Main ViewController
class RepoResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SettingsPresentingViewControllerDelegate {
    


    var searchBar: UISearchBar!
    var searchSettings = GithubRepoSearchSettings()

    @IBOutlet weak var tableView: UITableView!
    var repos: [GithubRepo]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the UISearchBar
        self.tableView.delegate = self
        self.tableView.dataSource = self
        searchBar = UISearchBar()
        searchBar.delegate = self
        
        // Add SearchBar to the NavigationBar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar

        // Perform the first search when the view controller first loads
        doSearch()
    }
    func didCancelSettings() {
        searchSettings.searchString = ""
        searchSettings.minStars = 0
    }
    
    func didSaveSettings(settings: GithubRepoSearchSettings) {
        self.searchSettings = settings
        doSearch()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if repos != nil {
        return repos!.count}
        else {
        return 0}
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepoCell
        cell.repo = repos[indexPath.row]
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        let vc = navController.topViewController as! SearchSettingsViewController
        vc.settings = searchSettings
        vc.delegate = self
        
    }

    // Perform the search.
    fileprivate func doSearch() {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        // Perform request to GitHub API to get the list of repositories
        GithubRepo.fetchRepos(searchSettings, successCallback: { (newRepos) -> Void in

            // Print the returned repositories to the output window
            for repo in newRepos {
                print(repo)
            }
            self.repos = newRepos
            self.tableView.reloadData()
            MBProgressHUD.hide(for: self.view, animated: true)
            }, error: { (error) -> Void in
                print(error)
        })
        
    }
}

// SearchBar methods
extension RepoResultsViewController: UISearchBarDelegate {

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchSettings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }
}
