//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Thuan Nguyen on 3/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit
protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}

class SearchSettingsViewController: UIViewController {
    
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    var minStars: Int?
    var settings: GithubRepoSearchSettings!
    weak var delegate: SettingsPresentingViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        minStars = settings.minStars
        slider.value = Float(minStars!)
        starLabel.text = "Stars: \(minStars!)"       // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
       self.minStars = Int(slider.value)
        
        let stars = Int(sender.value)
        starLabel.text = "Stars: " + String(stars)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        settings.minStars = minStars!
        self.delegate?.didSaveSettings(settings: settings)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
         self.delegate?.didCancelSettings()
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
