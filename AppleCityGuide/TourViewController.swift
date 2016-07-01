//
//  TourViewController.swift
//  AppleCityGuide
//
//  Created by user on 23.06.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit
import KFSwiftImageLoader



class TourViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tourTypeFilter: UISegmentedControl!
    
    var stringURL = "https://data.egov.kz/api/v2/almoblturoperator/v1?pretty"
    
    // var stringURL: String!
    //  stringURL = "https://data.egov.kz/api/v2/almoblturoperator/v1={Query in Json Object}"
    
    
    /*  @IBAction func tourTypeFilter(sender: UISegmentedControl) {
     guard let keyword = searchBar.text else { return }
     if sender.selectedSegmentIndex == 0{
     stringURL="https://data.egov.kz/api/v2/almoblturoperator/v1?q=\(keyword)+inauthor:keyes&key=AIzaSyBP072Zl-Tv4BOZvYJiR9tREMRCTOUnq00"+"&orderBy=newest"
     
     }else {
     stringURL="https://www.googleapis.com/books/v1/volumes?q=\(keyword)+inauthor:keyes&key=AIzaSyBP072Zl-Tv4BOZvYJiR9tREMRCTOUnq00"+"&orderBy=relevance"
     
     }
     downloadBook()
     
     }
     
     */
   
    
    var tours = [[String: AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.dataSource = self
        tableView.delegate = self
       downloadTour()
    }
    
    func downloadTour(){
        guard let url = NSURL(string: stringURL) else {
            print("url problem")
            return
        }
        
        let urlRequest = NSMutableURLRequest(URL: url)
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(urlRequest) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            guard let jsonData = data else {
                print("no data has been downloaded")
                return
            }
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.AllowFragments)  as! [[String: AnyObject]]
                self.tours = json
     //           print(self.tours)
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
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SegueCart"{
         let detailTourVC = segue.destinationViewController as! CartViewController
         let index = sender  as! NSIndexPath
           detailTourVC.tourDetail = tours[index.row]
        
            
            
            
            
        }
     }
}




extension TourViewController: UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tours.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("SegueCart", sender: indexPath)
        print("Hello Work!")
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("detailsTableViewCell", forIndexPath: indexPath) as! detailsTableViewCell
        
      if let tourData = self.tours[indexPath.row] as? [String: AnyObject] {
            cell.tourName?.text = tourData["sxema"] as? String
            cell.daysDuration?.text = tourData["dlitelnost"] as? String
            cell.tourLength?.text = tourData["dlina"] as? String
        // cell.tourComplexity?.text = tourData["kategory"] as? String
            cell.tourType?.text = tourData["peredvijenye"] as? String
        
            let days = tourData["dlitelnost"] as? String
            let matches = matchesForRegexInText("\\d+", text: days)
            print(matches)
        }
        return cell
    }
    
    
    // for returning days as ["days"]
    func matchesForRegexInText(regex: String!, text: String!) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = text as NSString
            let results = regex.matchesInString(text,
                                                options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substringWithRange($0.range)}
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
//    func getComplexityNumber(dni: Int, length: Int ) -> Int {
//        
//        let result = length/dni
//       // return result
//        
//        if result  <= 10{
//            return
//        }
//       
//    }
//    
//
}
