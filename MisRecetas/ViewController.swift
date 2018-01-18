//
//  ViewController.swift
//  MisRecetas
//
//  Created by ilnanü on 27/12/17.
//  Copyright © 2017 desvio85. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        
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
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    //MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name!
        cell.timeLabel.text = "\(recipe.time!) min"
        cell.ingredientsLabel.text = "Ingredientes: \(recipe.ingredients.count)"
        
        /*if recipe.isFavourite {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }*/
        
        /*cell.thumbnailImageView.layer.cornerRadius = 42.0
        cell.thumbnailImageView.clipsToBounds = true*/
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.recipes.remove(at: indexPath.row)
        }
        
        //self.tableView.reloadData()
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir" ) { (action,indexPath) in
            let shareDeaultText = "Estoy mirando la receta \(self.recipes[indexPath.row].name) en la App de Recetas"
            let activityController = UIActivityViewController(activityItems: [shareDeaultText, self.recipes[indexPath.row].image!], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
            
        }
        shareAction.backgroundColor = UIColor.cyan
        //borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar" ) { (action,indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        return [shareAction, deleteAction]
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
            }
        }
    }
   
}

