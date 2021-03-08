//
//  FoodView.swift
//  nibm_cobsccomp192p016
//
//  Created by Ravindu Tharaka Ranathunga on 2021-03-06.
//


import UIKit

class FoodViewController: UIViewController, UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var catogary: UICollectionView!
    @IBOutlet weak var cartView: UITableView!
    @IBOutlet weak var ItemView: UITableView!
    @IBOutlet weak var FoodItemTable: UITableView!
    
    var cur = 1;
    let FoodName  = [("Food 01"),("Food 02"),("Food 03")]
    override func viewDidLoad() {
        super.viewDidLoad()
        cartView.dataSource = self
        cartView.delegate = self
        catogary.dataSource = self
        ItemView.dataSource = self
        ItemView.delegate = self
    }
        
    let Catogary  = [("Catogary 01"),("Catogary 02"),("Catogary 03"),("Catogary 04")]
    let FoodName2 = [("HotDog"),("HotDog2"),("Pizza")]
    let FoodDiscription = [("Sample 02"),("Sample 03"),("Sample 04")]
    let Price = [(200),(300),(400)]
    let ImageView = [UIImage(named: "HotDog2"),
                         UIImage(named: "HotDog"),
                         UIImage(named: "Pizza")]
    let Percentage = [("10%"),("20%"),("30%")]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FoodName2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == ItemView)
        {
            let FoodItems = ItemView.dequeueReusableCell(withIdentifier: "FoodItems", for: indexPath) as! FoodItemTableViewCell
            FoodItems.ImageView.image = self.ImageView[indexPath.row]
            FoodItems.FoodName2.text = self.FoodName2[indexPath.row]
            FoodItems.FoodDiscription.text = self.FoodDiscription[indexPath.row]
            FoodItems.Price.text = "Rs. " + String(self.Price[indexPath.row])
            FoodItems.Percentage.text = self.Percentage[indexPath.row]
            if(FoodItems.Percentage.text == ("0%"))
            {
                FoodItems.Percentage.isHidden = true;
            }
            else
            {
                FoodItems.Percentage.text = self.Percentage[indexPath.row] + " Off"
            }
                return FoodItems;
        }
        else if (tableView == cartView)
        {
            let cartCell = cartView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
            cartCell.lblName.text = self.FoodName[indexPath.row]
            return cartCell
            
            
        }
        else
        {
            return UITableViewCell()
        }
        

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Catogary.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let CatogaryCell = catogary.dequeueReusableCell(withReuseIdentifier: "CatogaryCell", for: indexPath) as! CatogaryCollectionViewCell
        CatogaryCell.LblCatogary.text = self.Catogary[indexPath.row]
        return CatogaryCell
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
