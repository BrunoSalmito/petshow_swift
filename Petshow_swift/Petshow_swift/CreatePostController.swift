//
//  CreatePostController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 07/10/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class CreatePostController: UITableViewController {
    
    let cellIdentifier = "CellAnimalListaController"
    var animais = [Animal]()
    
    var indicadorProgress:ActivityIndicadorViewPet =  ActivityIndicadorViewPet()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        callRestListaAnimal()
        //tableView.rowHeight = UITableViewAutomaticDimension
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
  
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func callRestListaAnimal(){
        self.indicadorProgress.open(self)
        DispatchQueue.main.async {
            CallRest.requestGetList(url: "animal/consulta/usuario/"+(FacebookUtil.usuarioLogado?.id?.stringValue )! ,callBack: self.preencherListaAnimal, callBackError: self.erro)
        }
    }
    @IBOutlet var seusAnimais: UITableViewCell!
    
    @IBOutlet var tableSeusAnimais: UITableView!
    @IBOutlet var cellAnimais: UITableViewCell!
    func preencherListaAnimal(json:[[String:AnyObject]]) -> Void{
        
        animais = JsonUtil.listByJsonResponseMap(Animal.self,json:json)
        
        DispatchQueue.main.sync {
            self.tableView.reloadData()
            self.indicadorProgress.close()
        }
    }
    
    func erro(mapErro:MapErrorRetornoRest){
        ComponentsUtil.backErrorRest(mapErro:mapErro,controller:self,progress:self.indicadorProgress)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return  175
        }
        
        if(indexPath.section == 1){
            return 100
        }
        
        if(indexPath.section == 2){
            return CGFloat((45 * animais.count) > 0 ? 1 : (45 * animais.count))
            
        }
        return UITableViewAutomaticDimension
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "segueByGridAnimalList" {
//            let controller =  (segue.destination as? UINavigationController)?.topViewController as? EdtAnimalController
//            controller?.animal = animalSelected
//        }
        
    }
    
   
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//      
//        if(indexPath.section == 0){
//            let cell = UITableViewCell(style: UITableViewCellStyle.default,  reuseIdentifier: "Cella")
//            
//            return cell
//        }
//        if(indexPath.section == 1){
//            let cell = UITableViewCell(style: UITableViewCellStyle.default,  reuseIdentifier: "CreatePostCell2")
//            
//            return cell
//        }
//        if(indexPath.section == 2){
//            let cell =  UITableViewCell(style: UITableViewCellStyle.default,  reuseIdentifier: "CreatePostCell3")
//            //cell.textLabel?.text = animais[indexPath.row ].nome!.description
//            
//            return cell
//        }
//        if(indexPath.section == 3){
//            let cell = UITableViewCell(style: UITableViewCellStyle.default,  reuseIdentifier: "CreatePostCell4")
//            
//            return cell
//        }
//        let cell = UITableViewCell()
//        
//        
//        return cell
//       
//    }
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
