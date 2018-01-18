//
//  OtherViewController.swift
//  MisRecetas
//
//  Created by ilnanü on 3/1/18.
//  Copyright © 2018 desvio85. All rights reserved.
//

import UIKit

class OtherViewController: UITableViewController {
  
    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var recipe = Recipe(name: "Fabada", image: #imageLiteral(resourceName: "fabada"),
                            time: 120,
                            ingredients: ["fabes","chorixo","morcilla","tocino"],
                            steps: ["1.Limpiar fabes", "2.Cocer fabes", "3.Comer fabes"])
        recipes.append(recipe)
        recipe = Recipe(name: "Hamburguesa", image: #imageLiteral(resourceName: "hamburguesa"),
                        time: 120,
                        ingredients: ["carne","pan","queso","lechuga"],
                        steps: ["1.Freir carne", "2.Montar hamburguesa", "3.Comer hamburguesa"])
        recipes.append(recipe)
        recipe = Recipe(name: "Ensalada", image: #imageLiteral(resourceName: "ensalada"),
                        time: 120,
                        ingredients: ["lechuga","tomate","cebolla","aceite"],
                        steps: ["1.Limpiar lechuga", "2.Cortar verduras", "3.Comer Ensalada"])
        recipes.append(recipe)
        recipe = Recipe(name: "Patatas Fritas", image: #imageLiteral(resourceName: "patata"),
                        time: 120,
                        ingredients: ["patatas","aceite","sal"],
                        steps: ["1.Pelar patatas", "2.Freir patatas", "3.Comer Patatas"])
        recipes.append(recipe)
        recipe = Recipe(name: "Cocido", image: #imageLiteral(resourceName: "cocido"),
                        time: 240,
                        ingredients: ["sopa","fideos","garbanzos"],
                        steps: ["1.Hacer sopa", "2.Cocer garbanzos", "3.Comer Cocido"])
        recipes.append(recipe)
        recipe = Recipe(name: "Alitas de Pollo", image:#imageLiteral(resourceName: "alitas de pollo"),
                        time: 120,
                        ingredients: ["alitas","aceite","sal"],
                        steps: ["1.Freir alitas", "2.Echar sal", "3.Comer Alitas"])
        recipes.append(recipe)
        recipe = Recipe(name: "Judias Verdes con Tomate", image: #imageLiteral(resourceName: "judias"),
                        time: 20,
                        ingredients: ["judias verdes","tomate","ajo","jamón"],
                        steps: ["1.Cocer judias", "2.Freir tomate", "3.Comer judias"])
        recipes.append(recipe)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "FullRecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! FullRecipeCell
        cell.recipeImageView.image = recipe.image
        cell.recipeNameLabel.text = recipe.name!
        
        /*if recipe.isFavourite {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }*/
        
        /*cell.thumbnailImageView.layer.cornerRadius = 42.0
         cell.thumbnailImageView.clipsToBounds = true*/
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print ("He seleccionado la fila \(indexPath.row)")
        
        /*let recipe = self.recipes[indexPath.row]
        let alertController = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        let favouriteAction = UIAlertAction(title: recipe.isFavourite ? "No Favorita":"Favorita", style: recipe.isFavourite ? .destructive : .default) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            self.tableView.reloadData()
        }
        alertController.addAction(favouriteAction)
        self.present(alertController, animated: true, completion: nil)
         */
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
