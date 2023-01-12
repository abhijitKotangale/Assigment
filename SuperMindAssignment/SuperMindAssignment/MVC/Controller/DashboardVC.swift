//
//  DashboardVC.swift
//  SuperMindAssignment
//
//  Created by Abhijit Kotangale on 11/01/23.
//

import UIKit

class DashboardVC: BaseVC, TimerTigeredDelegate {
    
    //Outlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateMainView: UIView!
    
    var selecedTag = 0
    
    var goalData:[GoalsModel]? = []{
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    var activityData:[ActivityModel]? = []{
        didSet{
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hide Contents
        dateMainView.isHidden = true
        
        //Set Minimum date time validation
        datePicker.minimumDate = today
        
        //Register Cell
        Utils.registerCollectionCell(collection: collectionView, identifier: "GoalsCollectionCell")
        Utils.registerCell(table: tblView, identifier: "ActivityViewCell")
        
        //Retrieve Goals Data
        self.getGoalsData()
        //Retrieve Activity Data
        self.getActivityData()
    }
    
    //MARK: - Store Data in Goals Model
    private func getGoalsData(){
        goalData?.append(contentsOf: [GoalsModel(goalTitle: "Day 1: Steps To Recharge", goalCategory: "Meditation", goalCoachName: "Muskaan", availableXP: 10, time: 10, profilePic: "pencil.tip"), GoalsModel(goalTitle: "Day 2: Steps To Recharge", goalCategory: "Meditation", goalCoachName: "Muskaan", availableXP: 10, time: 10, profilePic: "bolt.horizontal.circle.fill"), GoalsModel(goalTitle: "Day 3: Steps To Recharge", goalCategory: "Meditation", goalCoachName: "Muskaan", availableXP: 10, time: 10, profilePic: "paperplane.fill")])
    }
    
    //MARK: - Store Data in Activity Model
    private func getActivityData(){
        activityData?.append(contentsOf: [ActivityModel(activityTitle: "Gratitude", activityCategory: "Journal", availableXP: 10, time: 1, categoryPic: "pencil.tip"), ActivityModel(activityTitle: "For Inner Peace", activityCategory: "Music", availableXP: 10, time: 60, categoryPic: "bolt.horizontal.circle.fill"), ActivityModel(activityTitle: "Gratitude1", activityCategory: "Journal1", availableXP: 10, time: 1, categoryPic: "paperplane.fill")])
    }
    
    //MARK: - Explore Action
    @IBAction func btnExploreAction(_ sender: Any) {
    }
    
    //MARK: - Activity Timer Callback
    func activityTimerClicked(tag: Int) {
        selecedTag = tag
        self.dateMainView.isHidden = false
    }
    
    //MARK: - Cancel Date Picker
    @IBAction func btnDateCancelAction(_ sender: UIBarButtonItem) {
        self.dateMainView.isHidden = true
    }
    
    //MARK: - Done Date Picker
    @IBAction func btnDateDoneAction(_ sender: UIBarButtonItem) {
        
        //Time formatter
        dateFormate.dateFormat = "HH:mm"
        
        //Selected Time
        let timer = dateFormate.string(from: datePicker.date)
        
        //Calculation
        let timeDate = dateFormate.date(from: timer)!
        let calendar = Calendar.current
        let selectedTime = calendar.dateComponents([.hour, .minute], from: timeDate)
        let currentTime = calendar.dateComponents([.hour, .minute], from: Date())
        
        let setTimer = calendar.dateComponents([.minute], from: selectedTime, to: currentTime).minute!
        
        let model = activityData?[selecedTag]
        let title = "\(model?.activityTitle ?? "")"
        let category = "\(model?.activityCategory ?? "")"
        let xp = model?.availableXP ?? 0
        let catPic = "\(model?.categoryPic ?? "")"
        
        //Remove Data
        activityData?.remove(at: selecedTag)
        
        activityData?.insert(ActivityModel(activityTitle: title, activityCategory: category, availableXP: xp, time: abs(setTimer), categoryPic: catPic), at: selecedTag)
        
        //Hide Date Picker
        self.dateMainView.isHidden = true
    }
    
    
    
}//End Main Class

//MARK: - UICollectionView Methods
extension DashboardVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.goalData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoalsCollectionCell", for: indexPath) as! GoalsCollectionCell
        
        let model = goalData?[indexPath.row]
        
        cell.imgProfilePic.image = UIImage(systemName: "\(model?.profilePic ?? "")")
        cell.lblGoalTitle.text = "\(model?.goalTitle ?? "")"
        cell.lblGoalCategory.text = "\(model?.goalCategory ?? "")"
        cell.lblCoachName.text = "Coach - \(model?.goalCoachName ?? "")"
        cell.lblXP.text = "\(model?.availableXP ?? 0) XP"
        cell.lblTime.text = "\(model?.time ?? 0) mins"
        
        return cell
    }
} //End Main Class

//MARK: - UITableView Methods
extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.activityData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityViewCell", for: indexPath) as! ActivityViewCell
        
        let model = activityData?[indexPath.row]
        
        cell.imgActivity.image = UIImage(systemName: "\(model?.categoryPic ?? "")")
        cell.lblActivityTitle.text = "\(model?.activityTitle ?? "")"
        cell.lblActivityCategory.text = "\(model?.activityCategory ?? "")"
        cell.lblXP.text = "\(model?.availableXP ?? 0) XP"
        cell.lblTime.text = "\(model?.time ?? 0) mins"
        
        //Set Tag
        cell.btnActivityTime.tag = indexPath.row
        cell.delegate = self
        
        return cell
    }
    
    
}

