//
//  TourViewController.swift
//  AppleCityGuide
//
//  Created by user on 23.06.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit
import KFSwiftImageLoader

final class TourViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var tours = [[String: AnyObject]]()
    private var stringURL = "https://data.egov.kz/api/v2/almoblturoperator/v1?"
    override func viewDidLoad() {
        super.viewDidLoad()
        stringURL += "source={\"size\":100}&pretty".stringByAddingPercentEncodingWithAllowedCharacters(.URLPathAllowedCharacterSet())!
        downloadTour()
 
        
        view.backgroundColor = UIColor.whiteColor()
        title = "Explore"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "burger.png"), style: .Plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "sliders.png"), style: .Plain, target: self, action: #selector(SSASideMenu.presentRightMenuViewController))
    }
    
    
    
    
    private var tourImages: [UIImage] =  {
        var arr = [UIImage]()
        for index in 1...119 {
            if let image = UIImage(named:"\(index)") {
                arr.append(image)
            }
        }
        return arr
    }()
    
  
    private var carTours = "source={\"size\":100,\"query\": {\"bool\":{\"must\":[{\"match\":{\"peredvijenye\": \"Автомобильный\"}}]}}}".stringByAddingPercentEncodingWithAllowedCharacters(.URLPathAllowedCharacterSet())
    private var hikingTours = "source={\"size\":100,\"query\": {\"bool\":{\"must\":[{\"match\":{\"peredvijenye\": \"пеший\"}}]}}}".stringByAddingPercentEncodingWithAllowedCharacters(.URLPathAllowedCharacterSet())
    private var aquaTours = "source={\"size\":100,\"query\": {\"bool\":{\"must\":[{\"match\":{\"peredvijenye\": \"водный\"}}]}}}".stringByAddingPercentEncodingWithAllowedCharacters(.URLPathAllowedCharacterSet())
    private var horseTours = "source={\"size\":100,\"query\": {\"bool\":{\"must\":[{\"match\":{\"peredvijenye\": \"конный\"}}]}}}".stringByAddingPercentEncodingWithAllowedCharacters(.URLPathAllowedCharacterSet())

    // MARK: - Actions
    
//    @IBAction private func tourTypeFilter(sender: UISegmentedControl) {
//        if let carTours = carTours where sender.selectedSegmentIndex == 0 {
//            stringURL="https://data.egov.kz/api/v2/almoblturoperator/v1?"+carTours
//            print(stringURL)
//        } else if let hikingTours = hikingTours where sender.selectedSegmentIndex == 1 {
//            stringURL="https://data.egov.kz/api/v2/almoblturoperator/v1?"+hikingTours
//        } else if let aquaTours = aquaTours where sender.selectedSegmentIndex == 2 {
//            stringURL="https://data.egov.kz/api/v2/almoblturoperator/v1?"+aquaTours
//        } else if let horseTours = horseTours where sender.selectedSegmentIndex == 3 {
//            stringURL="https://data.egov.kz/api/v2/almoblturoperator/v1?"+horseTours
//        }
//        
//        downloadTour()
//    }
    
    // MARK: - Networking
    
    func downloadTour() {
        guard let url = NSURL(string: stringURL) else {
            print("url problem")
            return
        }
        
        let urlRequest = NSURLRequest(URL: url)
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(urlRequest) { data, response, error in
            guard let jsonData = data else {
                print("no data has been downloaded")
                return
            }
            do {
                guard let json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments)
                    as? [[String: AnyObject]] else { return }
                self.tours = json
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                })
            } catch {
                print("error with JSON: ")
            }
        }
        task.resume()
    }
    
    // MARK: - Navigation
    
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SegueCart" {
            let detailTourVC = segue.destinationViewController as! CartViewController
            let index = sender as! NSIndexPath
            detailTourVC.tourDetail = tours[index.row]
            detailTourVC.tourImage = tourImages[index.row % tourImages.count]
        }
     }
}

extension TourViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tours.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("SegueCart", sender: indexPath)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("detailsTableViewCell", forIndexPath: indexPath) as! detailsTableViewCell
        let tour = tours[indexPath.row]
        cell.tour = tours[indexPath.row]
        cell.tourName?.text = tour["sxema"] as? String ?? ""
        cell.daysDuration?.text = tour["dlitelnost"] as? String ?? ""
        cell.tourLength?.text = tour["dlina"] as? String ?? ""
        cell.tourType?.text = tour["peredvijenye"] as? String ?? ""
        cell.thumImage.image = tourImages[indexPath.row]

        return cell
    }
}
